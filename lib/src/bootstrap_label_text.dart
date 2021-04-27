import 'package:flutter/material.dart';

class BootstrapLabelText extends StatelessWidget {
  const BootstrapLabelText({
    required this.child,
    this.bottomPadding = 5.0,
  });

  final Widget child;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: DefaultTextStyle.merge(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        child: child,
      ),
    );
  }
}
