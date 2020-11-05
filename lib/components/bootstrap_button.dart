import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'bootstrap_colors.dart';

class BootstrapButton extends StatelessWidget {
  const BootstrapButton({
    Key key,
    this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.visualDensity,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.enableFeedback = true,
    this.child,
    this.type = BootstrapButtonType.defaults,
    this.size = BootstrapButtonSize.defaults,
    this.outline = false,
  });

  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final ValueChanged<bool> onHighlightChanged;
  final MouseCursor mouseCursor;
  final ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;
  final Color splashColor;
  final Color focusColor;
  final Color hoverColor;
  final Color highlightColor;
  final double elevation;
  final double hoverElevation;
  final double focusElevation;
  final double highlightElevation;
  final double disabledElevation;
  final Brightness colorBrightness;
  final Widget child;
  bool get enabled => onPressed != null || onLongPress != null;
  final EdgeInsetsGeometry padding;
  final VisualDensity visualDensity;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final Duration animationDuration;
  final MaterialTapTargetSize materialTapTargetSize;
  final double minWidth;
  final double height;
  final bool enableFeedback;

  final BootstrapButtonType type;
  final BootstrapButtonSize size;
  final bool outline;

  final Map<BootstrapButtonSize, double> _fontSize = const {
    BootstrapButtonSize.large: 18,
    BootstrapButtonSize.defaults: 14,
    BootstrapButtonSize.small: 12,
    BootstrapButtonSize.mini: 12,
  };

  final Map<BootstrapButtonSize, double> _borderRadius = const {
    BootstrapButtonSize.large: 6,
    BootstrapButtonSize.defaults: 4,
    BootstrapButtonSize.small: 3,
    BootstrapButtonSize.mini: 3,
  };

  final Map<BootstrapButtonSize, double> _paddingHorizontal = const {
    BootstrapButtonSize.large: 24,
    BootstrapButtonSize.defaults: 20,
    BootstrapButtonSize.small: 18,
    BootstrapButtonSize.mini: 12,
  };

  final Map<BootstrapButtonSize, double> _paddingVertical = const {
    BootstrapButtonSize.large: 20,
    BootstrapButtonSize.defaults: 16,
    BootstrapButtonSize.small: 14,
    BootstrapButtonSize.mini: 10,
  };

  final Map<BootstrapButtonType, Color> _textColor = const {
    BootstrapButtonType.defaults: BootstrapColors.buttonDefaultText,
    BootstrapButtonType.primary: BootstrapColors.buttonPrimaryText,
    BootstrapButtonType.success: BootstrapColors.buttonSuccessText,
    BootstrapButtonType.info: BootstrapColors.buttonInfoText,
    BootstrapButtonType.warning: BootstrapColors.buttonWarningText,
    BootstrapButtonType.danger: BootstrapColors.buttonDangerText,
  };

  final Map<BootstrapButtonType, Color> _outlineTextColor = const {
    BootstrapButtonType.defaults: BootstrapColors.buttonDefaultOutlineText,
    BootstrapButtonType.primary: BootstrapColors.buttonPrimaryOutlineText,
    BootstrapButtonType.success: BootstrapColors.buttonSuccessOutlineText,
    BootstrapButtonType.info: BootstrapColors.buttonInfoOutlineText,
    BootstrapButtonType.warning: BootstrapColors.buttonWarningOutlineText,
    BootstrapButtonType.danger: BootstrapColors.buttonDangerOutlineText,
  };

  final Map<BootstrapButtonType, Color> _backgroundColor = const {
    BootstrapButtonType.defaults: BootstrapColors.buttonDefaultBackground,
    BootstrapButtonType.primary: BootstrapColors.buttonPrimaryBackground,
    BootstrapButtonType.success: BootstrapColors.buttonSuccessBackground,
    BootstrapButtonType.info: BootstrapColors.buttonInfoBackground,
    BootstrapButtonType.warning: BootstrapColors.buttonWarningBackground,
    BootstrapButtonType.danger: BootstrapColors.buttonDangerBackground,
  };

  final Map<BootstrapButtonType, Color> _borderColor = const {
    BootstrapButtonType.defaults: BootstrapColors.buttonDefaultBorder,
    BootstrapButtonType.primary: BootstrapColors.buttonPrimaryBorder,
    BootstrapButtonType.success: BootstrapColors.buttonSuccessBorder,
    BootstrapButtonType.info: BootstrapColors.buttonInfoBorder,
    BootstrapButtonType.warning: BootstrapColors.buttonWarningBorder,
    BootstrapButtonType.danger: BootstrapColors.buttonDangerBorder,
  };

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? 0.65 : 1,
      child: FlatButton(
        child: DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: _fontSize[size],
            fontWeight: FontWeight.w400,
            color: outline ? _outlineTextColor[type] : _textColor[type],
          ),
          child: child,
        ),
        padding: EdgeInsets.only(
          left: _paddingHorizontal[size],
          right: _paddingHorizontal[size],
          top: _paddingVertical[size],
          bottom: _paddingVertical[size],
        ),
        height: 0,
        minWidth: 0,
        color: outline ? Colors.transparent : _backgroundColor[type],
        disabledColor: outline ? Colors.transparent : _backgroundColor[type],
        hoverColor: outline ? _backgroundColor[type] : Colors.transparent,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              _borderRadius[size],
            ),
          ),
          borderSide: BorderSide(
            color: _borderColor[type],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

enum BootstrapButtonType {
  defaults,
  primary,
  success,
  info,
  warning,
  danger,
  link,
}

enum BootstrapButtonSize {
  large,
  defaults,
  small,
  mini,
}
