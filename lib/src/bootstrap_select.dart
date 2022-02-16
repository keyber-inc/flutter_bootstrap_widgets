import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';

class BootstrapSelect extends StatelessWidget {
  const BootstrapSelect({
    required this.options,
    required this.onChanged,
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
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: Card(
        color: enabled ? Colors.white : BootstrapColors.grayLighter,
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
            child: DropdownButton<dynamic>(
              value: value,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 20,
              elevation: 16,
              isExpanded: isExpanded,
              style: TextStyle(
                color: BootstrapColors.grayDark,
                fontSize: 14,
              ),
              underline: null,
              onChanged: (newValue) {
                onChanged(newValue);
              },
              items: options.map<DropdownMenuItem>((BootstrapOption option) {
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

class BootstrapMultiSelect extends StatefulWidget {
  const BootstrapMultiSelect({
    required this.options,
    required this.onChanged,
    this.values = const [],
    this.height = 94,
  });

  final List<BootstrapOption> options;
  final Function(List<dynamic>) onChanged;
  final List<dynamic> values;
  final double height;

  @override
  _BootstrapMultiSelectState createState() => _BootstrapMultiSelectState();
}

class _BootstrapMultiSelectState extends State<BootstrapMultiSelect> {
  final _scrollController = ScrollController();
  List<int> _selectedIndexes = [];

  @override
  void initState() {
    super.initState();
    _selectedIndexes = [];
    widget.options.asMap().forEach((index, option) {
      if (widget.values.contains(option.value)) {
        _selectedIndexes.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
        height: widget.height,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, top: 5, right: 5, bottom: 5),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedIndexes.contains(index)) {
                      _selectedIndexes.remove(index);
                    } else {
                      _selectedIndexes.add(index);
                    }
                    _selectedIndexes.sort((a, b) {
                      return a - b;
                    });

                    List<dynamic> values = [];
                    _selectedIndexes.forEach((index) {
                      values.add(widget.options[index].value);
                    });
                    widget.onChanged(values);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 10, top: 2, bottom: 2),
                    color: _selectedIndexes.contains(index)
                        ? BootstrapColors.multiSelectSelectedBackground
                        : Colors.white,
                    child: Text(widget.options[index].name),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BootstrapOption {
  const BootstrapOption({
    required this.name,
    required this.value,
  });

  final String name;
  final dynamic value;
}
