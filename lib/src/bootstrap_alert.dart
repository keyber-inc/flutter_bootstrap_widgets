import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapAlert extends StatefulWidget {
  const BootstrapAlert({
    this.type = BootstrapAlertType.defaults,
    required this.child,
    this.dismissble = false,
  });

  final BootstrapAlertType type;
  final Widget child;
  final bool dismissble;

  @override
  _BootstrapAlertState createState() => _BootstrapAlertState();
}

class _BootstrapAlertState extends State<BootstrapAlert> {
  bool _visible = true;
  late Widget _closeButton;

  final Map<BootstrapAlertType, Color> _textColor = const {
    BootstrapAlertType.defaults: BootstrapColors.alertDefaultText,
    BootstrapAlertType.success: BootstrapColors.alertSuccessText,
    BootstrapAlertType.info: BootstrapColors.alertInfoText,
    BootstrapAlertType.warning: BootstrapColors.alertWarningText,
    BootstrapAlertType.danger: BootstrapColors.alertDangerText,
  };

  final Map<BootstrapAlertType, Color> _backgroundColor = const {
    BootstrapAlertType.defaults: BootstrapColors.alertDefaultBackground,
    BootstrapAlertType.success: BootstrapColors.alertSuccessBackground,
    BootstrapAlertType.info: BootstrapColors.alertInfoBackground,
    BootstrapAlertType.warning: BootstrapColors.alertWarningBackground,
    BootstrapAlertType.danger: BootstrapColors.alertDangerBackground,
  };

  final Map<BootstrapAlertType, Color> _borderColor = const {
    BootstrapAlertType.defaults: BootstrapColors.alertDefaultBorder,
    BootstrapAlertType.success: BootstrapColors.alertSuccessBorder,
    BootstrapAlertType.info: BootstrapColors.alertInfoBorder,
    BootstrapAlertType.warning: BootstrapColors.alertWarningBorder,
    BootstrapAlertType.danger: BootstrapColors.alertDangerBorder,
  };

  @override
  void initState() {
    super.initState();
    _closeButton = Opacity(
      opacity: 0.2,
      child: IconButton(
        icon: Icon(Icons.close_sharp),
        iconSize: 18,
        padding: const EdgeInsets.all(0),
        constraints: const BoxConstraints(),
        onPressed: () {
          setState(() {
            _visible = false;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Card(
            color: _backgroundColor[widget.type],
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: _borderColor[widget.type]!,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            margin: const EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: DefaultTextStyle.merge(
                style: TextStyle(
                  color: _textColor[widget.type],
                ),
                child: Row(
                  children: [
                    widget.child,
                    const Spacer(),
                    widget.dismissble ? _closeButton : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum BootstrapAlertType {
  defaults,
  success,
  info,
  warning,
  danger,
}
