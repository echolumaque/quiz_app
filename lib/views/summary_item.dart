import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.itemData,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Color(isCorrectAnswer ? 0xFF75BFF7 : 0xFFFE69F6),
          child: Text(
            '${(itemData['question_index'] as int) + 1}',
            style: GoogleFonts.lato(
              fontSize: 15,
              color: const Color.fromARGB(255, 22, 2, 56),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${itemData['question']}',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${itemData['user_answer']}',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: const Color(0xFFFE69F6),
                ),
              ),
              Text(
                '${itemData['correct_answer']}',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: const Color(0xFF75BFF7),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
