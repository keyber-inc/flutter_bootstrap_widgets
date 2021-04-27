import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapCodeTextSpan extends WidgetSpan {
  BootstrapCodeTextSpan({
    required String text,
  }) : super(
          baseline: TextBaseline.alphabetic,
          alignment: PlaceholderAlignment.baseline,
          child: Container(
            padding: const EdgeInsets.only(left: 4, right: 4),
            decoration: BoxDecoration(
              color: BootstrapColors.codeDefaultBackground,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: BootstrapColors.codeDefaultText,
              ),
            ),
          ),
        );
}
