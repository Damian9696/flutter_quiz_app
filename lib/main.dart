import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

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
        body: _questionIndex < _questions.length ? Column(
          children: [
            Question(_questions[_questionIndex]["question"]),
            //The Spread operator ...
            ...(_questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ) : Center(
          child: Text("You did it!"),
        ),
      ),
    );
  }
}
