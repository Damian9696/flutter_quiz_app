import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int totalScore;
  final Function resetQuiz;

  String get resultPhrase {
    var resultText;

    if (totalScore == 4) {
      resultText = "Great job";
    } else if (totalScore == 3) {
      resultText = "Good memory";
    } else if (totalScore == 2) {
      resultText = "You know something";
    } else if (totalScore == 1) {
      resultText = "Poorly";
    } else {
      resultText = "You need to remind a few things";
    }

    return "$resultText \nYour score: $totalScore";
  }

  Result(this.totalScore, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(onPressed: resetQuiz, child: Text("Restart Quiz"))
        ],
      ),
    );
  }
}
