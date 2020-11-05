import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapHeading extends StatelessWidget {
  const BootstrapHeading.h1({
    Key key,
    @required this.child,
    this.type = BootstrapHeadingType.none,
    this.marginTop = 20,
    this.marginBottom = 10,
  }) : _fontSize = 36;

  const BootstrapHeading.h2({
    Key key,
    @required this.child,
    this.type = BootstrapHeadingType.none,
    this.marginTop = 20,
    this.marginBottom = 10,
  }) : _fontSize = 30;

  const BootstrapHeading.h3({
    Key key,
    @required this.child,
    this.type = BootstrapHeadingType.none,
    this.marginTop = 20,
    this.marginBottom = 10,
  }) : _fontSize = 24;

  const BootstrapHeading.h4({
    Key key,
    @required this.child,
    this.type = BootstrapHeadingType.none,
    this.marginTop = 10,
    this.marginBottom = 10,
  }) : _fontSize = 18;

  const BootstrapHeading.h5({
    Key key,
    @required this.child,
    this.type = BootstrapHeadingType.none,
    this.marginTop = 10,
    this.marginBottom = 10,
  }) : _fontSize = 14;

  const BootstrapHeading.h6({
    Key key,
    @required this.child,
    this.type = BootstrapHeadingType.none,
    this.marginTop = 10,
    this.marginBottom = 10,
  }) : _fontSize = 12;

  static const _fontWeight = FontWeight.w500;
  static const _smallScale = 0.65;
  final Widget child;
  final BootstrapHeadingType type;
  final double _fontSize;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BootstrapHeadingType.none:
        return DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: _fontWeight,
            color: BootstrapColors.grayDark,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: marginTop, bottom: marginBottom),
            child: child,
          ),
        );

      case BootstrapHeadingType.small:
        return DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: _fontSize * _smallScale,
            fontWeight: _fontWeight,
            color: BootstrapColors.grayLight,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: marginTop, bottom: marginBottom),
            child: child,
          ),
        );

      case BootstrapHeadingType.pageHeader:
        return DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: _fontWeight,
            color: BootstrapColors.grayDark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: marginTop),
                child: child,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: marginBottom - 1.4),
                child: Divider(
                  thickness: 1.4,
                  color: BootstrapColors.grayLighter,
                ),
              ),
            ],
          ),
        );
    }
    throw AssertionError('invalid BootstrapHeadingType');
  }
}

enum BootstrapHeadingType {
  none,
  small,
  pageHeader,
}
