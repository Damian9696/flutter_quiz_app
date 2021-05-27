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
  final _questions = const [
    {
      "question": "Date of initial release Flutter?",
      "answers": ["2015", "2016", "2017", "2018"]
    },
    {
      "question": "Where is the local capital of Poland?",
      "answers": ["Warsaw", "Cracow", "Gdynia", "Sopot"]
    },
    {
      "question": "The founder of PayPal is...",
      "answers": ["Donald Trump", "Bill Gates", "Elon Musk", "Jeff Bezos"]
    },
    {
      "question": "The speed of light is...",
      "answers": ["399693 m/s", "399793 m/s", "299693 m/s", "299793 m/s"]
    },
  ];

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
