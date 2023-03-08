import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String output;

  Result(this.output);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(output));
  }
}
