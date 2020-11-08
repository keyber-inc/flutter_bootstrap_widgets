import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BootstrapDataTable extends StatefulWidget {
  const BootstrapDataTable({
    Key key,
    @required this.header,
    this.actions,
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
      columns: widget.source.columnConfigs.map((config) {
        return DataColumn(
          label: config.label,
          tooltip: config.tooltip,
          numeric: config.numeric,
          onSort: config.sortable
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

class BootstrapColumnConfig {
  const BootstrapColumnConfig({
    @required this.name,
    @required this.label,
    @required this.dataCell,
    this.tooltip,
    this.numeric = false,
    this.sortable = true,
    this.comparable,
  });

  final String name;
  final Widget label;
  final DataCell Function(dynamic value) dataCell;
  final String tooltip;
  final bool numeric;
  final bool sortable;
  final Comparable Function(dynamic value) comparable;
}

class BootstrapDataTableSource extends DataTableSource {
  BootstrapDataTableSource({
    @required this.columnConfigs,
    @required this.rows,
  });

  final List<BootstrapColumnConfig> columnConfigs;
  final List<Map<String, dynamic>> rows;

  @override
  DataRow getRow(int index) {
    List<DataCell> cells = [];
    for (final dataConfig in columnConfigs) {
      cells.add(dataConfig.dataCell(rows[index][dataConfig.name]));
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
    final name = columnConfigs[columnIndex].name;
    final cmp = columnConfigs[columnIndex].comparable;
    rows.sort((Map<String, dynamic> a, Map<String, dynamic> b) {
      final aValue = cmp != null ? cmp(a[name]) : a[name].toString();
      final bValue = cmp != null ? cmp(b[name]) : b[name].toString();
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
