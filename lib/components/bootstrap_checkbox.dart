import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapCheckbox extends StatefulWidget {
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
  _BootstrapCheckboxState createState() => _BootstrapCheckboxState();
}

class _BootstrapCheckboxState extends State<BootstrapCheckbox> {
  bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled
          ? () {
              setState(() {
                _value = !_value;
                if (widget.onChanged != null) {
                  widget.onChanged(_value);
                }
              });
            }
          : null,
      child: Row(
        children: [
          Checkbox(
            value: _value,
            onChanged: widget.enabled
                ? (value) {
                    setState(() {
                      _value = value;
                      if (widget.onChanged != null) {
                        widget.onChanged(_value);
                      }
                    });
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
              child: widget.label,
            ),
          ),
        ],
      ),
    );
  }
}
