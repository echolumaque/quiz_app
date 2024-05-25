import 'package:flutter/material.dart';
import 'package:quiz_app/views/quiz.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
