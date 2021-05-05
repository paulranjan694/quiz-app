import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

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
  final _questions = const [
    {
      'questionTitle': 'What\'s your fav color ?',
      'answers': [
        {'text': 'Black', 'score': 9},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionTitle': 'What\'s your fav animal ?',
      'answers': [
        {'text': 'Cat', 'score': 3},
        {'text': 'Dog', 'score': 5},
        {'text': 'Rabbit', 'score': 7},
        {'text': 'Turtle', 'score': 9},
      ],
    },
    {
      'questionTitle': 'What\'s your fav phone ?',
      'answers': [
        {'text': 'MI', 'score': 7},
        {'text': 'iPhone', 'score': 9},
        {'text': 'One Plus', 'score': 8},
        {'text': 'Samsung', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // print(_questionIndex);
    // if (_questionIndex < _questions.length) {
    //   print('More Questions!');
    // }
  }

  void _resetQuizHandler() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestions: _answerQuestions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuizHandler),
      ),
    );
  }
}
