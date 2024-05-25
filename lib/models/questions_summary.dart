import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text('${(data['question_index'] as int) + 1}'),
              Expanded(
                child: Column(
                  children: [
                    Text('${data['question']}'),
                    const SizedBox(height: 5),
                    Text('${data['user_answer']}'),
                    Text('${data['correct_answer']}'),
                  ],
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
