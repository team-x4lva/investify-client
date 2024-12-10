import 'package:flutter/material.dart';

class InvestifyAnimatedWidget extends StatefulWidget {
  final Widget child;
  final int index;
  final Duration? duration;
  final double offset;

  const InvestifyAnimatedWidget({
    super.key,
    required this.child,
    required this.index,
    this.duration,
    this.offset = 50,
  });

  @override
  State<InvestifyAnimatedWidget> createState() =>
      _InvestifyAnimatedWidgetState();
}

class _InvestifyAnimatedWidgetState extends State<InvestifyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value * widget.offset),
          child: Opacity(
            opacity: 1 - _animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
