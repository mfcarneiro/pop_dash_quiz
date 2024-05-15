import 'package:flutter/material.dart';
import 'package:pop_dash_quiz/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(
    this.summaryData, {
    super.key,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: summaryData
              .map(
                (data) => Column(
                  children: <Widget>[
                    SummaryItem(data),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
