require("dotenv").config();

const { onRequest } = require("firebase-functions/v2/https");
const cors = require("cors");
const admin = require("firebase-admin");
const crypto = require("crypto");

// node-fetch dynamic import
const fetch = (...args) =>
  import("node-fetch").then(({ default: fetch }) => fetch(...args));

/* ================= INITIALIZE ================= */
admin.initializeApp();
const db = admin.firestore();

const corsHandler = cors({ origin: true });

const API_BASE = "https://api.groq.com/openai/v1";
const MODEL = "llama-3.3-70b-versatile";
const GROQ_API_KEY = process.env.GROQ_API_KEY;

// In-memory uniqueness (per instance / cold start)
let usedQuestions = [];

/* ================= FUNCTION ================= */
exports.generateSatQuestion = onRequest(
  { region: "us-central1" },
  (req, res) => {
    corsHandler(req, res, async () => {
      try {
        /* ================= INPUT ================= */
        let { category, difficulty } = req.body;

        if (!category || !difficulty) {
          return res
            .status(400)
            .json({ error: "Category and difficulty are required" });
        }

        // 🔒 NORMALIZE (CRITICAL)
        category = category.trim();
        difficulty = difficulty.trim();

        let attempt = 0;
        const maxAttempts = 20;

        while (attempt < maxAttempts) {
          const variationSeed =
            Date.now() + Math.floor(Math.random() * 100000);

          /* ================= PROMPT ================= */
          const prompt = `
You are generating questions for a VERY LARGE SAT database.
Assume THOUSANDS of questions already exist.

Generate ONE SAT Math multiple-choice question that is:
- COMPLETELY NEW
- STRUCTURALLY DIFFERENT from typical SAT questions
- Uses a NEW equation form, reasoning path, and variable structure

Category: ${category}
Difficulty: ${difficulty}
Uniqueness Seed: ${variationSeed}

ABSOLUTE RULES:
- Do NOT reuse common SAT templates
- Do NOT reuse basic linear forms like ax+b=c
- Do NOT reuse common word problems (trains, tickets, rectangles)
- Change variable letters, structure, and logic flow
- Question must feel unfamiliar even to SAT experts

Difficulty constraints:
- Easy: 1–2 steps but still unique
- Medium: 2–3 non-obvious steps
- Hard: multi-layer reasoning with traps

Return STRICT JSON ONLY:

{
  "question": "A never-before-seen SAT-style math question",
  "options": {
    "A": "...",
    "B": "...",
    "C": "...",
    "D": "..."
  },
  "hint": "A subtle hint",
  "correct_answer": "A/B/C/D",
  "solution_steps": [
    "Step 1 explanation",
    "Step 2 explanation",
    "Step 3 explanation"
  ],
  "final_explanation": "120–150 word full reasoning"
}

FAIL CONDITIONS (REGENERATE IF ANY APPLY):
- Similar equation structure
- Similar story/context
- Merely changing numbers
- Reusing common SAT patterns

SAT Math only. No extra text.
`;

          /* ================= GROQ CALL ================= */
          const response = await fetch(`${API_BASE}/chat/completions`, {
            method: "POST",
            headers: {
              Authorization: `Bearer ${GROQ_API_KEY}`,
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              model: MODEL,
              messages: [
                {
                  role: "system",
                  content:
                    "You are an elite SAT question writer focused on originality.",
                },
                { role: "user", content: prompt },
              ],
              temperature: 0.95,
              max_tokens: 2200,
            }),
          });

          const data = await response.json();
          const text = data?.choices?.[0]?.message?.content || "";

          try {
            const result = JSON.parse(text);

            /* ================= NORMALIZE OUTPUT ================= */
            result.question = result.question?.trim() || "";
            result.options = result.options || {};
            result.hint = result.hint || "";
            result.correct_answer = result.correct_answer || "";
            result.solution_steps = Array.isArray(result.solution_steps)
              ? result.solution_steps
              : [];
            result.final_explanation = result.final_explanation || "";

            if (!result.question || result.question.length < 30) {
              attempt++;
              continue;
            }

            /* ================= STRUCTURAL HASH ================= */
            const structureHash = crypto
              .createHash("sha256")
              .update(
                result.question
                  .toLowerCase()
                  .replace(/[0-9]/g, "#")
                  .replace(/[a-z]/g, "x")
              )
              .digest("hex");

            /* ================= DUPLICATE CHECK ================= */

            // In-memory
            if (usedQuestions.includes(result.question)) {
              attempt++;
              continue;
            }

            // Firestore exact text
            const textSnap = await db
              .collection("sat_questions")
              .where("question", "==", result.question)
              .limit(1)
              .get();

            if (!textSnap.empty) {
              attempt++;
              continue;
            }

            // Firestore structural duplicate
            const structureSnap = await db
              .collection("sat_questions")
              .where("structure_hash", "==", structureHash)
              .limit(1)
              .get();

            if (!structureSnap.empty) {
              attempt++;
              continue;
            }

            /* ================= SAVE TO FIRESTORE ================= */
            await db.collection("sat_questions").add({
              category,
              difficulty,
              question: result.question,
              options: result.options,
              hint: result.hint,
              correct_answer: result.correct_answer,
              solution_steps: result.solution_steps,
              final_explanation: result.final_explanation,
              structure_hash: structureHash,
              createdAt: admin.firestore.FieldValue.serverTimestamp(),
              source: "groq_ai_unique_v3",
            });

            usedQuestions.push(result.question);

            return res.status(200).json({
              ...result,
              unique: true,
            });
          } catch (err) {
            console.error("JSON parse failed:", err);
          }

          attempt++;
        }

        /* ================= FAILURE ================= */
        return res.status(200).json({
          error:
            "Unable to generate a completely unique SAT question after many attempts",
        });
      } catch (err) {
        console.error("FUNCTION ERROR:", err);
        return res.status(500).json({ error: err.message });
      }
    });
  }
);
