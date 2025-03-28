import 'package:flutter/material.dart';
import 'package:quizzy/brain_question.dart';

void main() => runApp(MyQuizzy());

class MyQuizzy extends StatelessWidget {
  const MyQuizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Quizzy'),
          centerTitle: true,
          elevation: 2,
          shadowColor: Colors.blueGrey,
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKepper = [];
  int questionNumber = 0;
  void changeQuestion(bool userAnswer) {
    if (questionNumber < BrainQuestion().questionBrain.length - 1) {
      if (userAnswer == BrainQuestion().questionBrain[questionNumber].questionAnswer) {
        scoreKepper.add(Icon(Icons.check, color: Colors.green,));
      }else{
        scoreKepper.add(Icon(Icons.close, color: Colors.red,));
      }
      questionNumber++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  BrainQuestion().questionBrain[questionNumber].questionText,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    onPressed: () {
                      setState(() {
                        changeQuestion(true);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                    ),
                    child: Text(
                      'False',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        changeQuestion(false);
                      });
                      //The user picked false.
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
          child: Row(children: scoreKepper),
        ),
      ],
    );
  }
}
