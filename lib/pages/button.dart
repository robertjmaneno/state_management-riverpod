import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryColor;

    return MaterialButton(
      onPressed: onPressed,
      color: theme,
      child: Text(name),
    );
  }
}
