import 'package:flutter/material.dart';

import '../helper/helper_functions.dart';
import 'quiz_page.dart';

class ClassesList extends StatelessWidget {
  const ClassesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout logic here

              logout(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            // First Card
            classCard(
              context,
              titleText: 'French',
              leftSubText: '10 Questions',
              rightSubText: '',
              baseColor: Colors.blue, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            // Second Card
            classCard(
              context,
              titleText: 'German',
              leftSubText: '10 Questions',
              rightSubText: '',
              baseColor: Colors.green, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
            ),
            const SizedBox(height: 16),

            classCard(
              context,
              titleText: 'Arabic',
              leftSubText: '10 Questions',
              rightSubText: '',
              baseColor: Colors.red, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
            ),
            const SizedBox(height: 16),

            classCard(
              context,
              titleText: 'Spanish',
              leftSubText: '10 Questions',
              rightSubText: '',
              baseColor: Colors.orange, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            // Second Card
            classCard(
              context,
              titleText: 'Chinese',
              leftSubText: '10 Questions',
              rightSubText: '',
              baseColor: Colors.indigo, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
            ),
            const SizedBox(height: 16),

            classCard(
              context,
              titleText: 'Japanese',
              leftSubText: '10 Questions',
              rightSubText: '',
              baseColor: Colors.purple, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
            ),
            const SizedBox(height: 16),

            classCard(
              context,
              titleText: 'Hebrew',
              leftSubText: '10 Questions',
              rightSubText: '',
              baseColor: Colors.yellow, // Set the base color here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            // You can add more cards here as needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Handle FAB action
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget classCard(
    BuildContext context, {
    required String titleText,
    required String leftSubText,
    required String rightSubText,
    required MaterialColor baseColor,
    required VoidCallback onPressed,
  }) {
    final backgroundColor = baseColor.shade50;
    final titleColor = baseColor.shade800;

    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor, // Set the background color
        padding: EdgeInsets.zero, // Remove default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      titleText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      leftSubText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      rightSubText,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
