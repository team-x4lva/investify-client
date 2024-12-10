import 'package:flutter/material.dart';

class InvestifyButton extends StatefulWidget {
  const InvestifyButton({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.showShadow = false,
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
  State<InvestifyButton> createState() => _InvestifyButtonState();
}

class _InvestifyButtonState extends State<InvestifyButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      onPanUpdate: (_) {
        if (isPressed) {
          setState(() {
            isPressed = false;
          });
        }
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: widget.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [theme.primaryColor, theme.colorScheme.secondary]),
              boxShadow: widget.showShadow || isPressed
                  ? [
                      BoxShadow(
                          offset: const Offset(3, 5),
                          blurRadius: 10,
                          color: theme.colorScheme.secondary),
                    ]
                  : null,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          margin: widget.margin,
          child: widget.child),
    );
  }
}
