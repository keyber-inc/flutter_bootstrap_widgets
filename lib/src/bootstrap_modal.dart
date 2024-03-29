import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';
import 'bootstrap_device_mode.dart';

class BootstrapModal extends StatefulWidget {
  const BootstrapModal({
    Key? key,
    this.title,
    this.content,
    this.actions,
    this.dismissble = false,
    this.size = BootstrapModalSize.medium,
  }) : super(key: key);

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool dismissble;
  final BootstrapModalSize size;

  @override
  _BootstrapModalState createState() => _BootstrapModalState();
}

class _BootstrapModalState extends State<BootstrapModal> {
  late double _width;
  Widget? _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title != null
        ? Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: BootstrapColors.modalDefaultBorder,
                  width: 1.0,
                ),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: DefaultTextStyle.merge(
              style: const TextStyle(
                color: BootstrapColors.grayDark,
              ),
              child: Row(
                children: [
                  widget.title!,
                  const Spacer(),
                  widget.dismissble
                      ? Opacity(
                          opacity: 0.2,
                          child: IconButton(
                            icon: const Icon(Icons.close_sharp),
                            iconSize: 18,
                            padding: const EdgeInsets.all(0),
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          )
        : null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    setState(() {
      final deviceMode =
          BootstrapDeviceModeHelper.valueOf(mediaQuery.size.width);
      switch (widget.size) {
        case BootstrapModalSize.large:
          _width = deviceMode == BootstrapDeviceMode.pc
              ? 900.0
              : deviceMode == BootstrapDeviceMode.tablet
                  ? 600.0
                  : double.infinity;
          break;
        case BootstrapModalSize.medium:
          _width = deviceMode == BootstrapDeviceMode.pc
              ? 600.0
              : deviceMode == BootstrapDeviceMode.tablet
                  ? 600.0
                  : double.infinity;
          break;
        case BootstrapModalSize.small:
          _width = deviceMode == BootstrapDeviceMode.pc
              ? 300.0
              : deviceMode == BootstrapDeviceMode.tablet
                  ? 300.0
                  : double.infinity;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding:
          const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
      title: _title,
      content: widget.content != null
          ? Container(
              width: _width,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BootstrapColors.modalDefaultBorder,
                    width: 1.0,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: widget.content,
            )
          : null,
      actions: widget.actions,
    );
  }
}

enum BootstrapModalSize {
  large,
  medium,
  small,
}
