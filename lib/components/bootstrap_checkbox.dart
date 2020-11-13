import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapCheckbox extends StatelessWidget {
  const BootstrapCheckbox({
    this.onChanged,
    this.value = false,
    this.label = const SizedBox(),
    this.enabled = true,
  });

  final Function(bool) onChanged;
  final bool value;
  final Widget label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled
          ? () {
              if (onChanged != null) {
                onChanged(!value);
              }
            }
          : null,
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: enabled
                ? (value) {
                    if (onChanged != null) {
                      onChanged(value);
                    }
                  }
                : null,
            activeColor: BootstrapColors.primary,
          ),
          DefaultTextStyle.merge(
            style: TextStyle(
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
