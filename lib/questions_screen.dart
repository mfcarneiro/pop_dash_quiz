import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pop_dash_quiz/data/questions.dart';
import 'package:pop_dash_quiz/answer_button.dart';

class QuestionScreens extends StatefulWidget {
  const QuestionScreens({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreens> createState() => _QuestionScreensState();
}

class _QuestionScreensState extends State<QuestionScreens> {
  final List<String> selectedAnswers = [];
  var currentQuestionIndex = 0;

  void incrementAnswerQuestion(String selectAnswer) {
    widget.onSelectAnswer(selectAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              currentQuestions.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestions.shuffleAnswers().map((answer) {
              return AnswerButton(
                buttonText: answer,
                onPressedButton: () {
                  incrementAnswerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
