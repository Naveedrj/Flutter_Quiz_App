import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final String question;
  final List<String> answers;

  const QuestionCard({Key? key, required this.question, required this.answers}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  List<String> userAnswerList = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.answers.map((answer) {
              return TextButton(
                onPressed: () {
                  userAnswerList.add(answer);
                },
                child: Text(answer),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
