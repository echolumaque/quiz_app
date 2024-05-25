import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/enums/active_widget.dart';
import 'package:quiz_app/views/questions_screen.dart';
import 'package:quiz_app/views/results_screen.dart';
import 'package:quiz_app/views/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _activeWidget = ActiveWidget.startScreen;
  final List<String> _selectedAnswers = [];

  void changeActiveScreen() {
    setState(() {
      _activeWidget = _activeWidget == ActiveWidget.startScreen
          ? ActiveWidget.questionsScreen
          : ActiveWidget.startScreen;
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        // _selectedAnswers.clear();
        _activeWidget = ActiveWidget.resultsScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF48008A),
                Color(0xFF5D0097),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
          child: switch (_activeWidget) {
            ActiveWidget.startScreen => StartScreen(
                fnToExecute: changeActiveScreen,
              ),
            ActiveWidget.questionsScreen => QuestionsScreen(
                onSelectAnswer: chooseAnswer,
              ),
            ActiveWidget.resultsScreen => ResultsScreen(
                chosenAnswers: _selectedAnswers,
              ),
          },
        ),
      ),
    );
  }
}
