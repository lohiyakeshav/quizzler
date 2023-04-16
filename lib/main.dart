import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Center(
            child: Text(
              "Quizzler",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

// Expanded decisionBox(Color color, String a) {
//   return Expanded(
//     child: Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: TextButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStatePropertyAll(color),
//         ),
//         onPressed: () {},
//         child: Text(style: TextStyle(color: Colors.white), a),
//       ),
//     ),
//   );
// }

List<Icon> scoreKeeper = [];

int questionNumber = 0;

//Q1 is hehe a god?, 'True'
//Q2 is Priyanshu a Snake?, 'True'
//Q3 is Vanshika smart?, 'False'


// List<String> questions = [
//   'Is hehe a god?',
//   'Is Priyanshu a Snake?',
//   'Is Vanshika smart?'
// ];
//
// Question q1 = Question(q: 'Is hehe a god?', a: true);
//
// List<bool> answers = [true, true, false];
//
// List<Question> questionBank =[
//   Question(q: 'Is hehe a god?', a: true),
//   Question(q: 'Is Priyanshu a Snake?', a: true),
//   Question(q: 'Is Vanshika smart?', a: false)
// ];

QuizBrain quizBrain = QuizBrain();


class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              onPressed: () {
                setState(
                  () {
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                    bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                    if (correctAnswer == true) {
                      print("Right");
                    } else {
                      print("Wrong");
                    }
                    questionNumber = questionNumber + 1;
                  },
                );
              },
              child: Text("True", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                setState(
                  () {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                    if (correctAnswer == false) {
                      print("Right");
                    } else {
                      print("Wrong");
                    }
                    questionNumber = questionNumber + 1;
                  },
                );
              },
              child: Text("False", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        // decisionBox(Colors.green, 'True'),
        // decisionBox(Colors.red, 'False'),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
