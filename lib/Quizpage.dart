import 'package:flutter/material.dart';
import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/Question_Card.dart';
import 'package:quiz_app/ResultScreen.dart';

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {

  List<String> userAnsList = [];
  int currentQuestionIndex = 0;
  int tureCounter = 0;


  answerQuestion(String answer){
    if(currentQuestionIndex < questions.length -1 ){
      setState(() {
        currentQuestionIndex++;
      });

    }else{
      print(userAnsList.length);//9
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(counter: tureCounter, userAns: userAnsList)));
    }
  }

  void trueOrNot(String answer){
    if(questions[currentQuestionIndex]['correctAnswer'] == answer){
      tureCounter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Flutter Quiz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Text(questions[currentQuestionIndex]['questionText'] ,
           textAlign: TextAlign.center,
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.blue[900],
           ),
           ),
            Container(
              padding: EdgeInsets.all(20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  questions[currentQuestionIndex]['answers'].length,
                      (index) {
                    String answer = questions[currentQuestionIndex]['answers'][index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          trueOrNot(answer);
                          userAnsList.add(answer);
                          answerQuestion(answer);
                        },
                        child: Text(answer),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
