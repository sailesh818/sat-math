import 'package:flutter/material.dart';

class AlgebraMediumPractise21 extends StatefulWidget {
  const AlgebraMediumPractise21({super.key});

  @override
  State<AlgebraMediumPractise21> createState() => _AlgebraMediumPractise21State();
}

class _AlgebraMediumPractise21State extends State<AlgebraMediumPractise21> {
  final List<Map<String,dynamic>> _questions = [
    {'question':'1. A recipe needs 3/4 cup of sugar. If you want to make 2 batches, how much sugar is needed?','options':['1 1/2 cups','1 1/4 cups','2 cups','1 cup'],'correctIndex':0},
    {'question':'2. A car traveled 2/3 of a mile in 1 minute. How far does it travel in 3 minutes?','options':['2 miles','1 2/3 miles','1 mile','2 1/2 miles'],'correctIndex':1},
    {'question':'3. John ate 1/5 of a pizza. Sarah ate 2/5. How much pizza was eaten in total?','options':['1/2','3/5','2/5','4/5'],'correctIndex':1},
    {'question':'4. A piece of ribbon is 7/8 m long. If 3 pieces are used, what is the total length?','options':['2 5/8 m','2 1/2 m','3 m','2 m'],'correctIndex':0},
    {'question':'5. A tank is filled with 1/6 liters per minute. How much is filled in 12 minutes?','options':['2 liters','1 liter','2 1/2 liters','1 1/2 liters'],'correctIndex':0},
  ];

  final Map<int,int> _selectedAnswers = {};
  void _selectAnswer(int qIndex,int selIndex)=>setState(()=>_selectedAnswers[qIndex]=selIndex);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: const Text('Algebra Medium - Practise 21'), backgroundColor: Colors.green.shade700, centerTitle:true, elevation:3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Text('Topic: Word Problems with Fractions', style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.green)),
            const SizedBox(height:8),
            const Text('Solve word problems involving fractions using algebra.', style: TextStyle(fontSize:15)),
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
          ],
        ),
      ),
    );
  }
}
