import 'package:flutter/material.dart';
import 'package:quizapp2/widgets/answer_widget.dart';
import 'package:quizapp2/widgets/question_widget.dart';

class Screen2 extends StatefulWidget {
  static const routename = '/Screen 2';
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late Map arguments;
  late var questionIndex;
  late var questions;
  late var totalScore;
  void answerQuestion(int score) {
    setState(() {
      questionIndex += 1;
    });

    totalScore += score;
  }

  void reset() {
    questionIndex = 0;
    totalScore = 0;
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void didChangeDependencies() {
    arguments = ModalRoute.of(context)!.settings.arguments as Map;
    questionIndex = arguments['currentIndex'];
    questions = arguments['questions'];
    totalScore = arguments['totalScore'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz 2"),
        ),
        body: questionIndex != questions.length
            ? Column(
                children: [
                  QuestionWidget(text: questions[questionIndex]['question']),
                  ...(questions[questionIndex]['answers'] as List)
                      .map((element) => AnswerWidget(
                          text: element['answerText'],
                          OnTap: () {
                            answerQuestion(element['score']);
                          })),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your total score $totalScore'),
                    TextButton(
                        onPressed: () {
                          reset();
                        },
                        child: Text("Retake the Quiz"))
                  ],
                ),
              ));
  }
}
