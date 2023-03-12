import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> domande;
  final answerQuestion;
  final int questionIndex;

  Quiz({
    @required this.domande,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(domande[questionIndex]['questionText']),
        ...(domande[questionIndex]['answers'] as List<Map<String, Object>>).map((domanda) {
          return Answer(()=> answerQuestion(domanda['score']), domanda['txt']);
        }).toList()
      ],
    );
  }
}

class voidCallback {
}
