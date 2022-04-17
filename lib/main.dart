import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'dart:math';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Survey(),
    );
  }
}

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  static const survey = [
    {
      'Question': 'what is your favorite food',
      'Answer': '["hamburger","spaghetti","salad"]'
    },
    {
      'Question': 'what is your favorite color',
      'Answer': '["red","blue","green"]'
    },
    {
      'Question': 'what is your favorite movie',
      'Answer': '["die hard","lion king","spiderman"]'
    },
  ];
  var answer = 0;
  var question = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(survey[question]['Question'].toString()),
                onPressed: () {
                  setState(() {
                    question = Random().nextInt(3);
                  });
                },
              ),
            SizedBox(height: 30.0,),
            ElevatedButton(
              child: Text(json.decode(survey[question]['Answer'].toString())[answer]),
              onPressed: () {
                setState(() {
                  answer = Random().nextInt(3);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              )
            ),
            //Answer(),
          ],
        ),
      ),
    );
  }
}


