import 'package:flutter/material.dart';
import 'package:quizapp_stuck/SimpleButton.dart';
import 'package:quizapp_stuck/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  // @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Suroolor suroolor = Suroolor();
  int questionIndex = 0;
  late bool ansver;
  void updateQuestrion(bool userChose) {
    if (userChose = ansver) {
      setState(() {
        icons.add(     Icon(
            Icons.check,
            size: 50.0,
            color: Colors.green,
          ),);
        questionIndex++;
        lastQuestion();
      });
      
    } else {
      setState(() {
        icons.add(    Icon(
            Icons.close,
            size: 50.0,
            color: Colors.red,
          ));
        questionIndex++;
        lastQuestion();
      });
      
    }
  }

  void lastQuestion() {
    if (questionIndex == suroolor.quizBrain.length) {  setState(() {
      questionIndex=0;
      icons = [];
    });};

  }


  List<Icon> icons = [];
  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 53, 53),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                suroolor.quizBrain[questionIndex].questions,
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
              SizedBox(
                height: 100,
              ),
              SimpleButton(
                text: 'Туура',
                color: Colors.green,
                onPressed: () {
                  setState(() {});
                  ansver = suroolor.quizBrain[questionIndex].ansvers;
                  updateQuestrion(true);
                },
              ),
              SizedBox(
                height: 30,
              ),
              SimpleButton(
                onPressed: () {
                  ansver = suroolor.quizBrain[questionIndex].ansvers;
                  updateQuestrion(false);
                  setState(() {});
                },
                text: 'Катаа',
                color: Colors.red,
              ),
              Row(
                children: icons,
              )
            ],
          ),
        ),
      ),
    );
  }
}
