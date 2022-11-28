import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() {
  runApp(const quizzler());
}

class quizzler extends StatelessWidget {
  const quizzler({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: quizpage(),
          ),
        ),
      ),
    );
  }
}

class quizpage extends StatefulWidget {
  const quizpage({Key key}) : super(key: key);

  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  int questionnumber = 0;
  List<Questions> questionbank = [
    Questions(a: 'You can lead a cow down stairs but not up stairs.', b: false),
    Questions(
        a: 'Approximately one quarter of human bones are in the feet.',
        b: true),
    Questions(a: 'A slug\'s blood is green.', b: true),
    Questions(a: 'Some cats are actually allergic to humans', b: true),
    Questions(a: 'You can lead a cow down stairs but not up stairs.', b: false),
    Questions(
        a: 'Approximately one quarter of human bones are in the feet.',
        b: true),
    Questions(a: 'A slug\'s blood is green.', b: true),
    Questions(a: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', b: true),
    Questions(a: 'It is illegal to pee in the Ocean in Portugal.', b: true),
    Questions(
        a: 'No piece of square dry paper can be folded in half more than 7 times.',
        b: false),
    Questions(
        a: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        b: true),
    Questions(
        a: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        b: false),
    Questions(
        a: 'The total surface area of two human lungs is approximately 70 square metres.',
        b: true),
    Questions(a: 'Google was originally called \"Backrub\".', b: true)
  ];
  List<Icon> scorekeeper = [];


  void checkanswer(bool userpicked) {
    setState((){
  bool answercheck = questionbank[questionnumber].answers;
  if (answercheck == userpicked) {
  scorekeeper.add(Icon(Icons.check,color: Colors.green,));
  } else {
  scorekeeper.add(Icon(Icons.close,color: Colors.red,));
  }
  });
  questionnumber++;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              questionbank[questionnumber].questionText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                onPressed: () {
                  checkanswer(true);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                onPressed: () {checkanswer(false);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
