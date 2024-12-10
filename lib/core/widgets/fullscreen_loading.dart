import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void showFullscreenLoading(context) {
  showDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return Center(
          child: LoadingAnimationWidget.threeArchedCircle(
              color: theme.primaryColor, size: 30),
        );
      },
      barrierDismissible: false);
}
