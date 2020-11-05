import 'package:flutter/material.dart';

class BootstrapDataTableSource<T> extends DataTableSource {
  BootstrapDataTableSource({
    @required this.rows,
    @required this.getCell,
    @required this.getText,
    @required this.cellCount,
  });

  final List<T> rows;
  final DataCell Function(T data, int columnIndex) getCell;
  final String Function(T data, int columnIndex) getText;
  final int cellCount;

  @override
  DataRow getRow(int index) {
    List<DataCell> cells = [];
    for (var i = 0; i < cellCount; i++) {
      cells.add(getCell(rows[index], i));
    }
    return DataRow.byIndex(
      index: index,
      cells: cells,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 0;

  void sort(int columnIndex, bool ascending) {
    rows.sort((a, b) {
      final aValue = getText(a, columnIndex);
      final bValue = getText(b, columnIndex);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
