import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhase {
    String resultText;
    if (totalScore <= 5) {
      resultText = 'You have failed!';
    } else if (totalScore <= 15) {
      resultText = 'You have passed but not so good!';
    } else {
      resultText = 'You have passed with good grades!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhase,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text(
              'Reset Quiz',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
