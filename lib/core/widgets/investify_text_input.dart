import 'package:flutter/material.dart';

class InvestifyTextInput extends StatelessWidget {
  const InvestifyTextInput({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintStyle: TextStyle(
            color: theme.hintColor.withOpacity(0.3),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: theme.colorScheme.secondary, width: 2.5),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
      ),
    );
  }
}
