import 'package:flutter/material.dart';

import 'bootstrap_colors.dart';
import 'bootstrap_option.dart';

class BootstrapMultiSelect extends StatefulWidget {
  const BootstrapMultiSelect({
    @required this.options,
    @required this.onChanged,
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

                    if (widget.onChanged != null) {
                      List<dynamic> values = [];
                      _selectedIndexes.forEach((index) {
                        values.add(widget.options[index].value);
                      });
                      widget.onChanged(values);
                    }
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
