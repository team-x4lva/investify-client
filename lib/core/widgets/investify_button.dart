import 'package:flutter/material.dart';

class InvestifyButton extends StatelessWidget {
  const InvestifyButton({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.showShadow = true,
    this.width,
    required this.onTap,
  });

  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final EdgeInsets? margin;
  final bool showShadow;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [theme.primaryColor, theme.colorScheme.secondary]),
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                          offset: const Offset(5, 3),
                          blurRadius: 20,
                          color: theme.colorScheme.secondary),
                    ]
                  : null,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          margin: margin,
          child: child),
    );
  }
}
