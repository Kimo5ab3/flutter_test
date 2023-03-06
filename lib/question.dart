import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //con final definisco che qiesta variabile non cambierà mai dopo la sua inizializzazione con il costruttore.
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
