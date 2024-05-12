import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Opacity( -> It is more expensive to compute
          //   opacity: 0.7,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     height: 250,
          //   ),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 250,
            // Alternative to opacity
            color: const Color.fromARGB(
              150,
              255,
              255,
              255,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              'Learn Flutter in the fun way',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: widget.startQuiz,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text(
              'Start Quiz!',
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(
              Icons.chevron_right_outlined,
            ),
          )
        ],
      ),
    );
  }
}
