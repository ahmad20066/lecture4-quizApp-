import 'package:flutter/material.dart';
import 'package:quizapp2/screens/screen2.dart';
import 'package:quizapp2/widgets/answer_widget.dart';
import 'package:quizapp2/widgets/drawer.dart';
import 'package:quizapp2/widgets/question_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List questions = [
    {
      'question': 'How many types of widgets are there in flutter?',
      'answers': [
        {'answerText': '3', 'score': 0},
        {'answerText': '1', 'score': 0},
        {'answerText': '4', 'score': 0},
        {'answerText': '2', 'score': 1}
      ]
    },
    {
      'question': 'Which of the following is an invisible widget?',
      'answers': [
        {'answerText': 'Container', 'score': 0},
        {'answerText': 'TextButton', 'score': 0},
        {'answerText': 'Column', 'score': 1},
        {'answerText': 'Icon', 'score': 0}
      ]
    },
    {
      'question':
          'Which property is used to create a white space arround a Container?',
      'answers': [
        {'answerText': 'margin', 'score': 1},
        {'answerText': 'padding', 'score': 0},
        {'answerText': 'border', 'score': 0},
        {'answerText': 'non of the above', 'score': 0}
      ]
    },
    {
      'question':
          'Which Widget is used to make a child widget align in the center?',
      'answers': [
        {'answerText': 'Center', 'score': 1},
        {'answerText': 'Padding', 'score': 0},
        {'answerText': 'Container', 'score': 0},
        {'answerText': 'both a and b', 'score': 0}
      ]
    },
    {
      'question':
          'Which of the following is used to align children vertically in a Column?',
      'answers': [
        {'answerText': 'crossAxisAlignment', 'score': 0},
        {'answerText': 'Align', 'score': 0},
        {'answerText': 'mainAxisAlignment', 'score': 1},
        {'answerText': 'non of the above', 'score': 0}
      ]
    },
    {
      'question':
          'Which of the following is used to align children horizontally in a Column?',
      'answers': [
        {'answerText': 'crossAxisAlignment', 'score': 1},
        {'answerText': 'Align', 'score': 0},
        {'answerText': 'mainAxisAlignment', 'score': 0},
        {'answerText': 'non of the above', 'score': 0}
      ]
    },
    {
      'question': 'Can you use both color and decoration in a container?',
      'answers': [
        {'answerText': 'Yes', 'score': 0},
        {'answerText': 'No', 'score': 1},
      ]
    },
    {
      'question':
          'Which method is used to navigate to another screen using its name?',
      'answers': [
        {'answerText': 'pushNamed', 'score': 0},
        {'answerText': 'pop', 'score': 0},
        {'answerText': 'popUntil', 'score': 1},
        {'answerText': 'push', 'score': 0}
      ]
    }
  ];
  int currentIndex = 0;
  int totalScore = 0;
  void answerQuestion(int score) {
    setState(() {
      currentIndex += 1;
    });

    totalScore += score;
  }

  final _scaffolKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffolKey,
        drawer: currentIndex == questions.length / 2
            ? NavigationDrawer(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Screen2.routename,
                      arguments: {
                        'currentIndex': currentIndex,
                        'questions': questions,
                        'totalScore': totalScore,
                      });
                },
              )
            : null,
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: currentIndex != questions.length / 2
            ? Column(
                children: [
                  QuestionWidget(text: questions[currentIndex]['question']),
                  ...(questions[currentIndex]['answers'] as List)
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
                          _scaffolKey.currentState!.openDrawer();
                        },
                        child: Text("Keep Going!"))
                  ],
                ),
              ));
  }
}
