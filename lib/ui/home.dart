import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("Test question 1", true),
    Question.name("Test question 2", false),
    Question.name("Test question 3:"
      "\n Life"
      "\n Pursuit of happiness",
    true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      //backgroundColor: Colors.blueGrey,

      // Builder is used to pass a context of scaffold
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("images/flag.png", height: 180, width: 250,)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    )
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,
                    //   style: TextStyle(
                    //   fontSize: 16.0,
                    //   color: Colors.white
                    // ),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _prevQuestion(),
                    child: Icon(Icons.arrow_back),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _checkAnswer(true, context),
                    child: Text("TRUE"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _checkAnswer(false, context),
                    child: Text("FALSE"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _nextQuestion(),
                    child: Icon(Icons.arrow_forward),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                    ),
                  )
                ],
              ),
              Spacer(),
            ],

          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //correct answer
      debugPrint("correct");

      final snackbar = SnackBar(
        content: Text("Correct! :)"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _nextQuestion();
    }else {
      //wrong answer
      debugPrint("incorrect");

      final snackbar = SnackBar(
        content: Text("Incorrect! :("),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex+1)%questionBank.length;
    });
    debugPrint("Index: $_currentQuestionIndex");
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex-1)%questionBank.length;
    });
    debugPrint("Index: $_currentQuestionIndex");
  }
}
