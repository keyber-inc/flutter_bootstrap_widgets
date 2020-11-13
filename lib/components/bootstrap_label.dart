import 'dart:math';

import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapLabel extends StatelessWidget {
  const BootstrapLabel({
    Key key,
    this.type = BootstrapLabelType.defaults,
    this.text = '',
    this.fontSize = 10,
    this.textColor = Colors.white,
  }) : super(key: key);

  final BootstrapLabelType type;
  final String text;
  final double fontSize;
  final Color textColor;

  final Map<BootstrapLabelType, Color> _backgroundColor = const {
    BootstrapLabelType.defaults: BootstrapColors.labelDefaultBackground,
    BootstrapLabelType.primary: BootstrapColors.labelPrimaryBackground,
    BootstrapLabelType.success: BootstrapColors.labelSuccessBackground,
    BootstrapLabelType.info: BootstrapColors.labelInfoBackground,
    BootstrapLabelType.warning: BootstrapColors.labelWarningBackground,
    BootstrapLabelType.danger: BootstrapColors.labelDangerBackground,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: _backgroundColor[type],
      ),
      padding: padding,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }

  double get _borderRadius => max(fontSize * 0.2, 2.0);
  EdgeInsetsGeometry get padding => EdgeInsets.symmetric(
        horizontal: min(fontSize * 0.4, 20),
        vertical: min(fontSize * 0.2, 5),
      );
}

enum BootstrapLabelType {
  defaults,
  primary,
  success,
  info,
  warning,
  danger,
}
