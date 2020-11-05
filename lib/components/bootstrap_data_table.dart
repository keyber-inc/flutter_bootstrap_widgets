import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BootstrapDataTable extends StatefulWidget {
  const BootstrapDataTable({
    Key key,
    @required this.header,
    this.actions,
    @required this.columns,
    this.sortColumnIndex = 0,
    this.sortAscending = true,
    this.onSelectAll,
    this.dataRowHeight = kMinInteractiveDimension,
    this.headingRowHeight = 56.0,
    this.horizontalMargin = 24.0,
    this.columnSpacing = 56.0,
    this.showCheckboxColumn = true,
    this.initialFirstRowIndex = 0,
    this.onPageChanged,
    this.enableRowsPerPage = true,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    this.availableRowsPerPage = const [
      PaginatedDataTable.defaultRowsPerPage,
      PaginatedDataTable.defaultRowsPerPage * 2,
      PaginatedDataTable.defaultRowsPerPage * 5,
      PaginatedDataTable.defaultRowsPerPage * 10,
    ],
    @required this.source,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : super(key: key);

  final Widget header;
  final List<Widget> actions;
  final List<BootstrapDataColumn> columns;
  final int sortColumnIndex;
  final bool sortAscending;
  final ValueSetter<bool> onSelectAll;
  final double dataRowHeight;
  final double headingRowHeight;
  final double horizontalMargin;
  final double columnSpacing;
  final bool showCheckboxColumn;
  final int initialFirstRowIndex;
  final ValueChanged<int> onPageChanged;
  final bool enableRowsPerPage;
  final int rowsPerPage;
  final List<int> availableRowsPerPage;
  final BootstrapDataTableSource source;
  final DragStartBehavior dragStartBehavior;

  @override
  _BootstrapDataTableState createState() => _BootstrapDataTableState();
}

class _BootstrapDataTableState extends State<BootstrapDataTable> {
  int _sortColumnIndex;
  bool _sortAscending;
  int _rowsPerPage;

  @override
  void initState() {
    super.initState();
    _sortColumnIndex = widget.sortColumnIndex;
    _sortAscending = widget.sortAscending;
    _rowsPerPage = widget.rowsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      header: widget.header,
      actions: widget.actions,
      columns: widget.columns.map((column) {
        return DataColumn(
          label: column.label,
          tooltip: column.tooltip,
          numeric: column.numeric,
          onSort: column.sortable
              ? (columnIndex, ascending) {
                  widget.source.sort(columnIndex, ascending);
                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;
                  });
                }
              : null,
        );
      }).toList(),
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      onSelectAll: widget.onSelectAll,
      dataRowHeight: widget.dataRowHeight,
      headingRowHeight: widget.headingRowHeight,
      horizontalMargin: widget.horizontalMargin,
      columnSpacing: widget.columnSpacing,
      showCheckboxColumn: widget.showCheckboxColumn,
      initialFirstRowIndex: widget.initialFirstRowIndex,
      onPageChanged: widget.onPageChanged,
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: widget.availableRowsPerPage,
      onRowsPerPageChanged: widget.enableRowsPerPage
          ? (rowsPerPage) {
              setState(() {
                _rowsPerPage = rowsPerPage;
              });
            }
          : null,
      dragStartBehavior: widget.dragStartBehavior,
      source: widget.source,
    );
  }
}

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
