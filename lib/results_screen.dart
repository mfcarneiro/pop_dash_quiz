import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pop_dash_quiz/data/questions.dart';
import 'package:pop_dash_quiz/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.onRestartQuiz, {
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 230, 200, 253),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          QuestionSummary(summaryData),
          const SizedBox(height: 20),
          TextButton.icon(
            icon: const Icon(
              Icons.refresh_outlined,
              color: Colors.white70,
            ),
            onPressed: onRestartQuiz,
            label: const Text(
              'Restart quiz',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
