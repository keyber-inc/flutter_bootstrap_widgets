import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapRadio extends StatelessWidget {
  const BootstrapRadio({
    this.onChanged,
    this.groupValue,
    this.value,
    this.label = const SizedBox(),
  });

  final Function(dynamic)? onChanged;
  final dynamic groupValue;
  final dynamic value;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Row(
        children: [
          Radio(
            groupValue: groupValue,
            value: value,
            onChanged: onChanged,
            activeColor: BootstrapColors.primary,
          ),
          DefaultTextStyle.merge(
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: BootstrapColors.grayDark,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: label,
            ),
          ),
        ],
      ),
    );
  }
}
