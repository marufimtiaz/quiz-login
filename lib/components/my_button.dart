import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomButton({super.key, 
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, color: textColor) : const SizedBox.shrink(),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        side: borderColor != null
            ? BorderSide(color: borderColor!)
            : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
