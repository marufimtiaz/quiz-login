import 'package:flutter/material.dart';
import 'package:quiz/components/textfield.dart';
import 'package:quiz/helper/helper_functions.dart';

class QuizCreator extends StatefulWidget {
  const QuizCreator({super.key});

  @override
  State<QuizCreator> createState() => _QuizCreatorState();
}

class _QuizCreatorState extends State<QuizCreator> {
  final List<Widget> _questions = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _addQuestion();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addQuestion() {
    setState(() {
      _questions.add(QuestionSection(
        key: ValueKey(_questions.length),
        questionNumber: _questions.length + 1,
      ));
    });

    // Scroll to the end after adding a new question
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _saveQuiz() {
    // Implement save functionality here
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Quiz'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text('Total ${_questions.length} questions'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            controller: _scrollController,
            children: [
              ReorderableListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (int oldIndex, int newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  setState(() {
                    final question = _questions.removeAt(oldIndex);
                    _questions.insert(newIndex, question);
                  });
                },
                children: _questions,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton.tonal(
                      onPressed: _addQuestion,
                      style: FilledButton.styleFrom(elevation: 4),
                      child: const Text(
                        'Add Question',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    FilledButton(
                      onPressed: _saveQuiz,
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.green, elevation: 4),
                      child: const Text(
                        'Save Quiz',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionSection extends StatelessWidget {
  final int questionNumber;

  QuestionSection({super.key, required this.questionNumber});
  final TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:
            Colors.green.shade50.withOpacity(0.9), // Card-like background color
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(1, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Question $questionNumber ',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          CustomTextField(
              labelText: 'Enter question',
              hintText: '',
              controller: questionController),
          const SizedBox(height: 8),
          const Text('Enter options', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          ...List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomTextField(
                labelText: 'Option ${index + 1}',
              ),
            );
          }),
          // const Divider(height: 24, thickness: 1),
        ],
      ),
    );
  }
}
