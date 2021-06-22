import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText' :  'What\'s your favourite subject?',
      'answers' : [
          {'text': 'Red', 'score': 1},
          {'text': 'Green', 'score': 0},
          {'text': 'Blue', 'score': 0},
          {'text': 'Black', 'score': 0}
        ],
    },
    {
      'questionText' :  'What\'s you favourite animal?',
      'answers' : [
          {'text': 'Tiger', 'score': 0},
          {'text': 'Elephant', 'score' : 0},
          {'text': 'Sheep', 'score': 1},
          {'text': 'Deer', 'score': 0}
      ],
    },
    {
      'questionText' :  'Who\'s your favourite instructor?',
      'answers' : [
          {'text': 'Mad', 'score': 0},
          {'text': 'John', 'score': 0},
          {'text': 'Jim', 'score': 0},
          {'text': 'Josh', 'score': 1}
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });
    _totalScore += score;
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Quiz App'),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
        )
            : Result(resultScore: _totalScore, resetHandler: _resetQuiz,),
      ),
    );
  }
}

