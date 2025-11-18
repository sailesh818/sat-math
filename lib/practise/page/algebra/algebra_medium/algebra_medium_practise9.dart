import 'package:flutter/material.dart';

class AlgebraMediumPractise9 extends StatefulWidget {
  const AlgebraMediumPractise9({super.key});

  @override
  State<AlgebraMediumPractise9> createState() => _AlgebraMediumPractise9State();
}

class _AlgebraMediumPractise9State extends State<AlgebraMediumPractise9> {
  final List<Map<String,dynamic>> _questions = [
    {'question':'1. Sarah has 3 more than twice the number of apples as John. If Sarah has 11 apples, how many does John have?', 'options':['3','4','5','6'], 'correctIndex':1},
    {'question':'2. The sum of a number and its triple is 20. Find the number.', 'options':['4','5','6','7'], 'correctIndex':0},
    {'question':'3. A number decreased by 7 is equal to twice the number minus 5. Find the number.', 'options':['2','3','4','5'], 'correctIndex':3},
    {'question':'4. Three consecutive integers have a sum of 72. Find the integers.', 'options':['23,24,25','22,23,24','24,25,26','21,22,23'], 'correctIndex':0},
    {'question':'5. A rectangle’s length is 3 more than twice its width. If perimeter is 30, find width.', 'options':['4','3','5','6'], 'correctIndex':1},
  ];

  final Map<int,int> _selectedAnswers = {};
  void _selectAnswer(int qIndex,int selIndex)=>setState(()=>_selectedAnswers[qIndex]=selIndex);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: const Text('Algebra Medium - Practise 9'), backgroundColor: Colors.green.shade700, centerTitle:true, elevation:3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          const Text('Topic: Word Problem Equations', style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.green)),
          const SizedBox(height:8),
          const Text('Translate word problems into equations and solve.', style: TextStyle(fontSize:15)),
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
