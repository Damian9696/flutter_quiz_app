import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      "question": "Date of initial release Flutter?",
      "answers": [
        {"text": "2015", "score": 0},
        {"text": "2016", "score": 0},
        {"text": "2017", "score": 1},
        {"text": "2018", "score": 0}
      ]
    },
    {
      "question": "Where is the local capital of Poland?",
      "answers": [
        {"text": "Warsaw", "score": 1},
        {"text": "Cracow", "score": 0},
        {"text": "Gdynia", "score": 0},
        {"text": "Sopot", "score": 0}
      ]
    },
    {
      "question": "The founder of PayPal is...",
      "answers": [
        {"text": "Donald Trump", "score": 0},
        {"text": "Bill Gates", "score": 0},
        {"text": "Elon Musk", "score": 1},
        {"text": "Jeff Bezos", "score": 0}
      ]
    },
    {
      "question": "The speed of light is...",
      "answers": [
        {"text": "399693 m/s", "score": 0},
        {"text": "399793 m/s", "score": 0},
        {"text": "299693 m/s", "score": 0},
        {"text": "299793 m/s", "score": 1}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
            answerQuestion: _answerQuestion,
            questions: _questions,
            questionIndex: _questionIndex)
            : Result(_totalScore),
      ),
    );
  }
}
