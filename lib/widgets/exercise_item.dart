import 'package:flutter/material.dart';


class ExerciseItem extends StatelessWidget {
  final String child;

  const ExerciseItem({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Text(child),
        ),
      ),
    );
  }
}
