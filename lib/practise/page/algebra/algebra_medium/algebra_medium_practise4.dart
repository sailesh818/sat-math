import 'package:flutter/material.dart';

class AlgebraMediumPractise4 extends StatefulWidget {
  const AlgebraMediumPractise4({super.key});

  @override
  State<AlgebraMediumPractise4> createState() => _AlgebraMediumPractise4State();
}

class _AlgebraMediumPractise4State extends State<AlgebraMediumPractise4> {
  final List<Map<String,dynamic>> _questions = [
    {'question':'1. Solve: 2x + 5 = 11','options':['x=3','x=2','x=4','x=5'],'correctIndex':0},
    {'question':'2. Solve: 3x -4 = 11','options':['x=5','x=4','x=6','x=7'],'correctIndex':0},
    {'question':'3. Solve: 5x +2 = 17','options':['x=3','x=2','x=4','x=5'],'correctIndex':2},
    {'question':'4. Solve: 4x -7 = 9','options':['x=2','x=3','x=4','x=5'],'correctIndex':1},
    {'question':'5. Solve: 6x +3 = 27','options':['x=3','x=4','x=5','x=2'],'correctIndex':0},
  ];

  final Map<int,int> _selectedAnswers = {};
  void _selectAnswer(int qIndex,int selIndex)=>setState(()=>_selectedAnswers[qIndex]=selIndex);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: const Text('Algebra Medium - Practise 4'), backgroundColor: Colors.green.shade700,centerTitle:true,elevation:3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          const Text('Topic: Two-Step Linear Equations', style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.green)),
          const SizedBox(height:8),
          const Text('Solve each two-step linear equation.', style: TextStyle(fontSize:15)),
          const SizedBox(height:20),
          ...List.generate(_questions.length,(index){
            final q=_questions[index];
            final sel=_selectedAnswers[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical:10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation:3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(q['question'], style: const TextStyle(fontSize:17,fontWeight:FontWeight.w600)),
                    const SizedBox(height:12),
                    ...List.generate(q['options'].length,(optIndex){
                      final isSelected = sel==optIndex;
                      return GestureDetector(
                        onTap: ()=>_selectAnswer(index,optIndex),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical:5),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected? Colors.green.shade100: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color:isSelected?Colors.green:Colors.grey.shade300,width:1.5),
                          ),
                          child: Row(children:[
                            Icon(isSelected?Icons.radio_button_checked:Icons.radio_button_off, color: isSelected?Colors.green:Colors.grey),
                            const SizedBox(width:10),
                            Expanded(child: Text(q['options'][optIndex], style: const TextStyle(fontSize:16))),
                          ]),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height:20),
          Center(
            child: ElevatedButton.icon(
              onPressed: (){
                int score=0;
                for(int i=0;i<_questions.length;i++){if(_selectedAnswers[i]==_questions[i]['correctIndex']) score++;}
                showDialog(context: context, builder: (_)=>AlertDialog(title: const Text('Your Score'), content: Text('You got $score out of ${_questions.length} correct!'), actions:[TextButton(onPressed: ()=>Navigator.pop(context),child: const Text('OK'))]));
              },
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Check Answers'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700,padding: const EdgeInsets.symmetric(horizontal:40,vertical:12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const SizedBox(height:30),
        ]),
      ),
    );
  }
}
