import 'package:flutter/material.dart';
import 'package:quiz/helper/helper_functions.dart';
import '../quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int correctAnswer = 0;
  QuizBrain quizBrain = QuizBrain();

  void alertChoice() {
    if (correctAnswer > scoreKeeper.length / 2) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "CONGRATULATIONS",
        desc: "You had $correctAnswer correct answers!",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "OH NO!",
        desc: "You had only $correctAnswer correct answers!",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  void checkAnswer(String userAnswer) {
    setState(() {
      if (quizBrain.isFinished) {
        alertChoice();
        quizBrain.resetquestionNumber();
        scoreKeeper.clear();
        correctAnswer = 0;
      } else {
        if (quizBrain.getAnswer() == userAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
          correctAnswer++;
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  void reset() {}

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.05;
    final double buttonHeight = screenSize.height * 0.07;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Quiz',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  logout(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: padding, vertical: screenSize.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenSize.height * 0.03),
            Center(
              child: Text(
                'Quiz no ${scoreKeeper.length + 1}.',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            const Divider(color: Colors.grey),
            const Center(
              child: Text(
                'Tap to choose answer.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAnswerButton(
                      context, quizBrain.getChoice1(), buttonHeight),
                  SizedBox(height: padding * 0.5),
                  _buildAnswerButton(
                      context, quizBrain.getChoice2(), buttonHeight),
                  SizedBox(height: padding * 0.5),
                  _buildAnswerButton(
                      context, quizBrain.getChoice3(), buttonHeight),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerButton(BuildContext context, String label, double height) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          // Handle answer selection
          checkAnswer(label);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize: Size(double.infinity, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
