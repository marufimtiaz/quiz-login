import 'helper/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  bool isFinished = false;

  final List<Question> _questionData = [
    Question(
      questionText: '''What is the German word for 'Goat'?''',
      choice1: 'Ziege',
      choice2: 'Kuh',
      choice3: 'Hase',
      answer: 'Ziege',
    ),
    Question(
      questionText: '''What is the German word for 'Cat'?''',
      choice1: 'Katze',
      choice2: 'Hund',
      choice3: 'Maus',
      answer: 'Katze',
    ),
    Question(
      questionText: '''What is the German word for 'Dog'?''',
      choice1: 'Katze',
      choice2: 'Hund',
      choice3: 'Vogel',
      answer: 'Hund',
    ),
    Question(
      questionText: '''What is the German word for 'Mouse'?''',
      choice1: 'Maus',
      choice2: 'Ratte',
      choice3: 'Eichhörnchen',
      answer: 'Maus',
    ),
    Question(
      questionText: '''What is the German word for 'Bird'?''',
      choice1: 'Fisch',
      choice2: 'Vogel',
      choice3: 'Reptil',
      answer: 'Vogel',
    ),
    Question(
      questionText: '''What is the German word for 'Fish'?''',
      choice1: 'Fisch',
      choice2: 'Krabbe',
      choice3: 'Muschel',
      answer: 'Fisch',
    ),
    Question(
      questionText: '''What is the German word for 'Rabbit'?''',
      choice1: 'Hase',
      choice2: 'Kaninchen',
      choice3: 'Fuchs',
      answer: 'Hase',
    ),
    Question(
      questionText: '''What is the German word for 'Horse'?''',
      choice1: 'Pferd',
      choice2: 'Esel',
      choice3: 'Kühe',
      answer: 'Pferd',
    ),
    Question(
      questionText: '''What is the German word for 'Cow'?''',
      choice1: 'Ziege',
      choice2: 'Kuh',
      choice3: 'Schaf',
      answer: 'Kuh',
    ),
    Question(
      questionText: '''What is the German word for 'Sheep'?''',
      choice1: 'Schaf',
      choice2: 'Ziege',
      choice3: 'Lamm',
      answer: 'Schaf',
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionData.length - 1) {
      _questionNumber++;
      if (_questionNumber == _questionData.length - 1) {
        isFinished = true;
      }
    }
  }

  void resetquestionNumber() {
    _questionNumber = 0;
    isFinished = false;
  }

  String getQuestionText() {
    return _questionData[_questionNumber].questionText;
  }

  getChoice1() {
    return _questionData[_questionNumber].choice1;
  }

  getChoice2() {
    return _questionData[_questionNumber].choice2;
  }

  getChoice3() {
    return _questionData[_questionNumber].choice3;
  }

  getAnswer() {
    return _questionData[_questionNumber].answer;
  }
}
