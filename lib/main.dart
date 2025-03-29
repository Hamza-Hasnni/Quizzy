import 'package:flutter/material.dart';
import 'package:quizzy/brain_question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  void checkAnswer(bool userAnswer) {
    setState(() {
      if (BrainQuestion().isFinished() == false) {
        
    if (userAnswer == BrainQuestion().getCorrectAnswer()) {
      scoreKepper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreKepper.add(Icon(Icons.close, color: Colors.red));
    }
    BrainQuestion().nextQuestion();
      }else{
            Alert(
      context: context,
      title: "Quiz End",
      desc:'' ,
      buttons: [
        DialogButton(
          child: Text(
            "Play Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {},
          width: 120,
        )
      ],
    ).show();
      }
    });
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
                  BrainQuestion().getQuestionText(),
                  textAlign: TextAlign.center,
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
                      checkAnswer(true);
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
      
                      checkAnswer(false);
                    
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Row(children: scoreKepper),
        ),
      ],
    );
  }
}
