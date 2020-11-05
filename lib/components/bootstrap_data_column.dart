import 'package:flutter/material.dart';

class BootstrapDataColumn extends DataColumn {
  const BootstrapDataColumn({
    @required Widget label,
    String tooltip,
    bool numeric = false,
    this.sortable = true,
  }) : super(
          label: label,
          tooltip: tooltip,
          numeric: numeric,
        );

  final bool sortable;
}
