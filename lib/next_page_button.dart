import 'package:flutter/material.dart';



class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(16.0),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: Colors.white,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_upward,
        color: Color(0xFF2D3243),
        size: 32.0,
      ),
    );
  }
}
