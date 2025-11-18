import 'package:flutter/material.dart';

class AlgebraMediumPractise10 extends StatefulWidget {
  const AlgebraMediumPractise10({super.key});

  @override
  State<AlgebraMediumPractise10> createState() => _AlgebraMediumPractise10State();
}

class _AlgebraMediumPractise10State extends State<AlgebraMediumPractise10> {
  final List<Map<String,dynamic>> _questions = [
    {'question':'1. Solve: x² - 5x + 6 = 0','options':['x=2,3','x=-2,-3','x=1,6','x=-1,-6'],'correctIndex':0},
    {'question':'2. Solve: x² + x - 6 = 0','options':['x=-3,2','x=3,-2','x=1,6','x=-1,-6'],'correctIndex':0},
    {'question':'3. Solve: x² - 7x + 12 = 0','options':['x=3,4','x=-3,-4','x=2,6','x=-2,-6'],'correctIndex':0},
    {'question':'4. Solve: x² - 8x + 15 = 0','options':['x=3,5','x=-3,-5','x=5,3','x=-5,-3'],'correctIndex':0},
    {'question':'5. Solve: x² - 6x + 8 = 0','options':['x=2,4','x=-2,-4','x=1,8','x=-1,-8'],'correctIndex':0},
  ];

  final Map<int,int> _selectedAnswers = {};
  void _selectAnswer(int qIndex,int selIndex)=>setState(()=>_selectedAnswers[qIndex]=selIndex);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: const Text('Algebra Medium - Practise 10'), backgroundColor: Colors.green.shade700, centerTitle:true, elevation:3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          const Text('Topic: Simple Quadratic Equations by Factoring', style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.green)),
          const SizedBox(height:8),
          const Text('Factor the quadratic equations and find all solutions.', style: TextStyle(fontSize:15)),
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
