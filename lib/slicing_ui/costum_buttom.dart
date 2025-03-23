import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  final Color bgColor;
  final String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;
  final double sizeButton;

  const CostumButton({
    super.key,
    required this.bgColor,
    required this.labelColor,
    required this.labelButton,
    required this.onPressed,
    this.sizeButton = 1.0
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * sizeButton, 50),
          backgroundColor: bgColor,
        ),
        onPressed: () {
          onPressed.call();
        },
        child: Text(labelButton, style: TextStyle(color: labelColor)),
      ),
    );
  }
}