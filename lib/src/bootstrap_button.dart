import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapButton extends StatelessWidget {
  const BootstrapButton({
    Key? key,
    this.onPressed,
    this.onLongPress,
    required this.child,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.type = BootstrapButtonType.defaults,
    this.size = BootstrapButtonSize.defaults,
    this.outline = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget child;
  final BootstrapButtonType type;
  final BootstrapButtonSize size;
  final bool outline;
  bool get enabled => onPressed != null || onLongPress != null;

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
      child: TextButton(
        child: DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: _fontSize[size],
            fontWeight: FontWeight.w400,
            color: outline ? _outlineTextColor[type] : _textColor[type],
          ),
          child: child,
        ),
        style: TextButton.styleFrom(
          backgroundColor:
              outline ? Colors.transparent : _backgroundColor[type],
          padding: EdgeInsets.only(
            left: _paddingHorizontal[size]!,
            right: _paddingHorizontal[size]!,
            top: _paddingVertical[size]!,
            bottom: _paddingVertical[size]!,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              _borderRadius[size]!,
            ),
          ),
          side: BorderSide(
            color: _borderColor[type]!,
          ),
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autofocus,
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
