import 'package:flutter/material.dart';

class AlgebraMediumPractise14 extends StatefulWidget {
  const AlgebraMediumPractise14({super.key});

  @override
  State<AlgebraMediumPractise14> createState() => _AlgebraMediumPractise14State();
}

class _AlgebraMediumPractise14State extends State<AlgebraMediumPractise14> {
  final List<Map<String,dynamic>> _questions = [
    {'question':'1. A number increased by 7 and then doubled equals 20. Find the number.', 'options':['3','4','5','6'], 'correctIndex':0},
    {'question':'2. Twice a number minus 5 equals 11. Find the number.', 'options':['6','7','8','9'], 'correctIndex':2},
    {'question':'3. Three times a number plus 4 equals 19. Find the number.', 'options':['4','5','6','7'], 'correctIndex':1},
    {'question':'4. A number divided by 2 and then added 3 equals 7. Find the number.', 'options':['6','7','8','10'], 'correctIndex':0},
    {'question':'5. Four less than twice a number is 10. Find the number.', 'options':['6','7','8','9'], 'correctIndex':2},
  ];

  final Map<int,int> _selectedAnswers = {};
  void _selectAnswer(int qIndex,int selIndex)=>setState(()=>_selectedAnswers[qIndex]=selIndex);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: const Text('Algebra Medium - Practise 14'), backgroundColor: Colors.green.shade700, centerTitle:true, elevation:3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          const Text('Topic: Two-Step Word Problems', style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.green)),
          const SizedBox(height:8),
          const Text('Translate and solve two-step word problems using algebra.', style: TextStyle(fontSize:15)),
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
                  Text(q['question'], style: const TextStyle(fontSize:17,fontWeight:FontWeight.w600)),
                  const SizedBox(height:12),
                  ...List.generate(q['options'].length,(optIndex){
                    final isSelected=sel==optIndex;
                    return GestureDetector(
                      onTap: ()=>_selectAnswer(index,optIndex),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical:5),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:isSelected? Colors.green.shade100: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color:isSelected?Colors.green:Colors.grey.shade300,width:1.5),
                        ),
                        child: Row(children:[
                          Icon(isSelected?Icons.radio_button_checked:Icons.radio_button_off,color:isSelected?Colors.green:Colors.grey),
                          const SizedBox(width:10),
                          Expanded(child: Text(q['options'][optIndex],style: const TextStyle(fontSize:16))),
                        ]),
                      ),
                    );
                  }),
                ]),
              ),
            );
          }),
          const SizedBox(height:20),
          Center(
            child: ElevatedButton.icon(
              onPressed: (){
                int score=0;
                for(int i=0;i<_questions.length;i++){if(_selectedAnswers[i]==_questions[i]['correctIndex']) score++;}
                showDialog(context: context, builder: (_)=>AlertDialog(title: const Text('Your Score'), content: Text('You got $score out of ${_questions.length} correct!'), actions:[TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('OK'))]));
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
