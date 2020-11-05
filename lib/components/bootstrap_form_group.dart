import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapFormGroup extends StatelessWidget {
  const BootstrapFormGroup({
    this.children,
    this.direction = Axis.vertical,
    this.type,
  });

  final List<Widget> children;
  final Axis direction;
  final BootstrapFormGroupType type;

  final Map<BootstrapFormGroupType, Color> _textColor = const {
    BootstrapFormGroupType.success: BootstrapColors.alertSuccessText,
    BootstrapFormGroupType.warning: BootstrapColors.alertWarningText,
    BootstrapFormGroupType.error: BootstrapColors.alertDangerText,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: type != null
          ? TextStyle(
              color: _textColor[type],
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: direction == Axis.vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )
            : direction == Axis.horizontal
                ? Row(
                    children: children,
                  )
                : null,
      ),
    );
  }
}

enum BootstrapFormGroupType {
  success,
  warning,
  error,
}
