import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';
import 'bootstrap_option.dart';

class BootstrapSelect extends StatefulWidget {
  const BootstrapSelect({
    @required this.options,
    @required this.onChanged,
    this.value,
    this.isExpanded = true,
    this.enabled = true,
  });

  final List<BootstrapOption> options;
  final Function(dynamic) onChanged;
  final dynamic value;
  final bool isExpanded;
  final bool enabled;

  @override
  _BootstrapSelectState createState() => _BootstrapSelectState();
}

class _BootstrapSelectState extends State<BootstrapSelect> {
  dynamic _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enabled,
      child: Card(
        color: widget.enabled ? Colors.white : BootstrapColors.grayLighter,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: BootstrapColors.textFormFieldBorder,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        margin: const EdgeInsets.all(0.0),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, top: 5, right: 10, bottom: 5),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _value,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 20,
              elevation: 16,
              isExpanded: widget.isExpanded,
              style: TextStyle(
                color: BootstrapColors.grayDark,
                fontSize: 14,
              ),
              underline: null,
              onChanged: (newValue) {
                setState(() {
                  _value = newValue;
                  widget.onChanged(newValue);
                });
              },
              items: widget.options
                  .map<DropdownMenuItem>((BootstrapOption option) {
                return DropdownMenuItem(
                  value: option.value,
                  child: Text(option.name),
                );
              }).toList(),
              isDense: true,
            ),
          ),
        ),
      ),
    );
  }
}
