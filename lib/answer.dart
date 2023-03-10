import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //voidCallback specifica una funzione che non accetta parametri in entrata e non ritorna niente
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange.shade600),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text(answerText),
            onPressed: selectHandler,
          ),
    );
  }
}