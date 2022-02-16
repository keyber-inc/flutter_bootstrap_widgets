import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapPanel extends StatelessWidget {
  const BootstrapPanel({
    Key? key,
    this.type = BootstrapPanelType.defaults,
    this.header,
    this.body,
    this.footer,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  final BootstrapPanelType type;
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final EdgeInsetsGeometry padding;

  final Map<BootstrapPanelType, Color> _textColor = const {
    BootstrapPanelType.defaults: BootstrapColors.panelDefaultText,
    BootstrapPanelType.primary: BootstrapColors.panelPrimaryText,
    BootstrapPanelType.success: BootstrapColors.panelSuccessText,
    BootstrapPanelType.info: BootstrapColors.panelInfoText,
    BootstrapPanelType.warning: BootstrapColors.panelWarningText,
    BootstrapPanelType.danger: BootstrapColors.panelDangerText,
    BootstrapPanelType.green: BootstrapColors.panelGreenText,
    BootstrapPanelType.yellow: BootstrapColors.panelYellowText,
    BootstrapPanelType.red: BootstrapColors.panelRedText,
  };

  final Map<BootstrapPanelType, Color> _backgroundColor = const {
    BootstrapPanelType.defaults: BootstrapColors.panelDefaultBackground,
    BootstrapPanelType.primary: BootstrapColors.panelPrimaryBackground,
    BootstrapPanelType.success: BootstrapColors.panelSuccessBackground,
    BootstrapPanelType.info: BootstrapColors.panelInfoBackground,
    BootstrapPanelType.warning: BootstrapColors.panelWarningBackground,
    BootstrapPanelType.danger: BootstrapColors.panelDangerBackground,
    BootstrapPanelType.green: BootstrapColors.panelGreenBackground,
    BootstrapPanelType.yellow: BootstrapColors.panelYellowBackground,
    BootstrapPanelType.red: BootstrapColors.panelRedBackground,
  };

  final Map<BootstrapPanelType, Color> _borderColor = const {
    BootstrapPanelType.defaults: BootstrapColors.panelDefaultBorder,
    BootstrapPanelType.primary: BootstrapColors.panelPrimaryBorder,
    BootstrapPanelType.success: BootstrapColors.panelSuccessBorder,
    BootstrapPanelType.info: BootstrapColors.panelInfoBorder,
    BootstrapPanelType.warning: BootstrapColors.panelWarningBorder,
    BootstrapPanelType.danger: BootstrapColors.panelDangerBorder,
    BootstrapPanelType.green: BootstrapColors.panelGreenBorder,
    BootstrapPanelType.yellow: BootstrapColors.panelYellowBorder,
    BootstrapPanelType.red: BootstrapColors.panelRedBorder,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        color: _backgroundColor[type],
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _borderColor[type]!,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
        margin: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            if (header != null)
              Container(
                decoration: BoxDecoration(
                  color: _backgroundColor[type],
                  border: const Border(
                    bottom: BorderSide(
                      color: BootstrapColors.panelDefaultBorder,
                      width: 1.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                width: double.infinity,
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    color: _textColor[type],
                  ),
                  child: header ?? const SizedBox(),
                ),
              ),
            if (body != null)
              Container(
                color: BootstrapColors.bodyBackground,
                padding: padding,
                width: double.infinity,
                child: body,
              ),
            if (footer != null)
              Container(
                decoration: const BoxDecoration(
                  color: BootstrapColors.defaults,
                  border: Border(
                    top: BorderSide(
                      color: BootstrapColors.panelDefaultBorder,
                      width: 1.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                width: double.infinity,
                child: DefaultTextStyle.merge(
                  style: const TextStyle(
                    color: BootstrapColors.grayDark,
                  ),
                  child: footer ?? const SizedBox(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

enum BootstrapPanelType {
  defaults,
  primary,
  success,
  info,
  warning,
  danger,
  green,
  yellow,
  red,
}
