import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/Quizpage.dart';
class ResultScreen extends StatelessWidget {
   ResultScreen({required int this.counter ,required List<String> this.userAns ,super.key});

  final List<String> userAns;
  final int counter;
  final int totalQuestion = questions.length;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue,
        title: const Text('Results',
        style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You got ${counter} correct out of ${totalQuestion}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(userAns.length , (index){
                        return Column(
                          children: [
                            Text(userAns[index],
                            style: TextStyle(
                                fontSize: 15,
                                color:  questions[index]['correctAnswer'] == userAns[index] ? Colors.blue : Colors.red,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(questions[index]['correctAnswer'],
                              style: const TextStyle(
                                  fontSize: 15,
                                 color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 10,)
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[900]
              ),
                onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Quizpage()));
                },
                child: Text(
                  'Restart Quiz',
                ))
          ],
        ),
      ),

    );
  }
}
