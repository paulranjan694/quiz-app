import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestions() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('BTN pressed!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionTitle': 'What\'s your fav color ?',
        'answers': [
          'Black',
          'Red',
          'Green',
          'White',
        ],
      },
      {
        'questionTitle': 'What\'s your fav animal ?',
        'answers': [
          'Cat',
          'Dog',
          'Rabbit',
          'Turtle',
        ],
      },
      {
        'questionTitle': 'What\'s your fav phone ?',
        'answers': [
          'MI',
          'iPhone',
          'Samsung',
          'OnePlus',
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter!'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionTitle']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestions, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
