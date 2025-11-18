import 'package:flutter/material.dart';

class AlgebraMediumPractise6 extends StatefulWidget {
  const AlgebraMediumPractise6({super.key});

  @override
  State<AlgebraMediumPractise6> createState() => _AlgebraMediumPractise6State();
}

class _AlgebraMediumPractise6State extends State<AlgebraMediumPractise6> {
  final List<Map<String,dynamic>> _questions = [
    {'question':'1. Solve: -2x +5 = 3','options':['x=1','x=2','x=-1','x=-2'],'correctIndex':1},
    {'question':'2. Solve: -3x -4 = 2','options':['x=-2','x=2','x=-1','x=1'],'correctIndex':0},
    {'question':'3. Solve: -5x +3 = -2','options':['x=1','x=-1','x=2','x=-2'],'correctIndex':3},
    {'question':'4. Solve: -4x -6 = -10','options':['x=1','x=-1','x=2','x=-2'],'correctIndex':2},
    {'question':'5. Solve: -x +7 = 3','options':['x=4','x=-4','x=3','x=-3'],'correctIndex':0},
  ];

  final Map<int,int> _selectedAnswers = {};
  void _selectAnswer(int qIndex,int selIndex)=>setState(()=>_selectedAnswers[qIndex]=selIndex);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: const Text('Algebra Medium - Practise 6'), backgroundColor: Colors.green.shade700, centerTitle:true, elevation:3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          const Text('Topic: Equations with Negative Coefficients', style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.green)),
          const SizedBox(height:8),
          const Text('Solve equations with negative coefficients.', style: TextStyle(fontSize:15)),
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
                      final isSelected=sel==optIndex;
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
                            Icon(isSelected?Icons.radio_button_checked:Icons.radio_button_off,color:isSelected?Colors.green:Colors.grey),
                            const SizedBox(width:10),
                            Expanded(child: Text(q['options'][optIndex],style: const TextStyle(fontSize:16))),
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
