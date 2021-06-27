import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final ButtonStyle? style;
  final TextStyle? labeltStyle;

  const AuthElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.style,
    this.labeltStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 280,
      child: ElevatedButton(
        style: style ?? ElevatedButtonTheme.of(context).style,
        onPressed: onPressed,
        child: Text(
          label,
          style: labeltStyle ?? Theme.of(context).primaryTextTheme.button,
        ),
      ),
    );
  }
}
