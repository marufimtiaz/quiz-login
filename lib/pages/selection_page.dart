import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "I am a",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              GestureDetector(
                onTap: () {},
                child: const ChoiceCard(
                  icon: Icons.school,
                  text: 'Student',
                  color: Colors.green,
                  // Set border color here
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              GestureDetector(
                onTap: () {},
                child: const ChoiceCard(
                  icon: Icons.person,
                  text: 'Teacher',
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  // New property for border color
  // New property for height

  const ChoiceCard({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    // Include border color in constructor
    // Include height in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // Set width here
      height: MediaQuery.of(context).size.height * 0.12, // Set height here
//       margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ), // Set border color and width
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: InkWell(
        onTap: () {
          // You can add any action here if needed
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 40,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
