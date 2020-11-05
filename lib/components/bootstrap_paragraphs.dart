import 'package:flutter/material.dart';

class BootstrapParagraphs extends StatelessWidget {
  const BootstrapParagraphs({
    @required this.child,
    this.lead = false,
  });

  final Widget child;
  final bool lead;

  @override
  Widget build(BuildContext context) {
    TextStyle style = DefaultTextStyle.of(context).style;
    if (lead) {
      style = style.merge(TextStyle(fontSize: 21, fontWeight: FontWeight.w300));
    }
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DefaultTextStyle.merge(
                style: style,
                child: Padding(
                  padding: EdgeInsets.only(bottom: lead ? 20 : 10),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
