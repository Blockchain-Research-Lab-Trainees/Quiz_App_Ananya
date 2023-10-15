import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/q_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {Key? key}) : super(key: key);

  final Map<String, dynamic> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    final questionIndex =
      itemData['question'] is int
    ? itemData['question'] as int
    : isCorrectAnswer ? 0 : -1;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: questionIndex,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'].toString(),
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['user_answer'].toString(),
                    style: const TextStyle(
                      color: Colors.amberAccent,
                    )),
                Text(itemData['correct_answer'].toString(),
                    style: const TextStyle(
                      color: Colors.greenAccent,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
