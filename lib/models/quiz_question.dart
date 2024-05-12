class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffleAnswers() {
    final copyListAnswers = List.of(answers);
    copyListAnswers.shuffle();

    return copyListAnswers;
  }
}
