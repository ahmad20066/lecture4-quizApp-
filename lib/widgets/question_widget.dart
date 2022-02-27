import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  String text;
  QuestionWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
