import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Il tuo punteggio è ${resultScore}',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
