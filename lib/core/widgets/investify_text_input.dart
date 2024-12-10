import 'package:flutter/material.dart';

class InvestifyTextInput extends StatelessWidget {
  const InvestifyTextInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
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
            fontSize: 18,
            fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: theme.colorScheme.secondary, width: 2.5),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.error, width: 2.5),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.error, width: 2.5),
            borderRadius: BorderRadius.circular(20)),
        errorStyle: TextStyle(
            color: theme.colorScheme.error,
            fontWeight: FontWeight.bold,
            fontSize: 16),
        hintText: hintText,
      ),
    );
  }
}
