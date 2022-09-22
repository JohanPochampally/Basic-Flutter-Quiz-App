// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
// Mapping Questions to answers
  final _questions = const [
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Sandwich', 'score': 10},
        {'text': 'Pasta', 'score': 10},
        {'text': 'Rolls', 'score': 10},
        {'text': 'Puffs', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Green', 'score': 0},
        {'text': 'Grey', 'score': 10},
        {'text': 'Blue', 'score': 10},
        {'text': 'White', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite day?',
      'answers': [
        {'text': 'Sunday', 'score': 10},
        {'text': 'Monday', 'score': 10},
        {'text': 'Tuesday', 'score': 10},
        {'text': 'Wednesday', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('More questions!');
    } else {
      print('You\'re done!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello, Johan!'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestions: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
