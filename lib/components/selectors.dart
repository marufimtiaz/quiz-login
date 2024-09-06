import 'package:flutter/material.dart';

String? studentLabel;

class ChoiceCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color borderColor;
  final VoidCallback onTap;

  const ChoiceCard({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the provided onTap callback
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4, // Set width here
        height: MediaQuery.of(context).size.height * 0.12, // Set height here
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1,
          ), // Set border color and width
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
