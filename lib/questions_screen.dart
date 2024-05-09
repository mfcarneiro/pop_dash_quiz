import 'package:flutter/material.dart';

class QuestionScreens extends StatefulWidget {
  const QuestionScreens({super.key});

  @override
  State<QuestionScreens> createState() => _QuestionScreensState();
}

class _QuestionScreensState extends State<QuestionScreens> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Questions",
      ),
    );
  }
}
