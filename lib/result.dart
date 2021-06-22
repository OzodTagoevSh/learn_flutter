import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function() resetHandler;
  Result({required this.resultScore, required this.resetHandler});

  String get resultPhrase {
    String resultText;
    if(resultScore >= 3) {
      resultText = 'You won!';
    } else if(resultScore >= 2) {
      resultText = 'Almost to victory!';
    } else if(resultScore >= 1) {
      resultText = 'Too bad';
    } else {
      resultText = 'You lost!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetHandler,
              child: Text(
                'Restart Quiz!',
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
