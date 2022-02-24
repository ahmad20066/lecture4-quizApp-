import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  String text;
  final OnTap;
  AnswerWidget({required this.text, required this.OnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        margin: EdgeInsets.all(8),
        color: Colors.blue,
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
