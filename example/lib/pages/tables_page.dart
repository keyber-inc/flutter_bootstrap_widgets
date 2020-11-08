import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/flutter_bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class TablesPage extends StatelessWidget {
  static const route = '/tables';
  static const title = 'Tables';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      route: route,
      children: [
        BootstrapRow(
          height: 0,
          children: [
            BootstrapCol(
              sizes: 'col-12',
              child: BootstrapHeading.h1(
                child: SelectableText(title),
                type: BootstrapHeadingType.pageHeader,
              ),
            ),
          ],
        ),
        BootstrapRow(
          height: 0,
          children: [
            BootstrapCol(
              sizes: 'col-12',
              child: BootstrapPanel(
                header: const Text('DataTables Advanced Tables'),
                body: BootstrapDataTable(
                  header: Text('DataTables Advanced Tables'),
                  source: BootstrapDataTableSource(
                    columnConfigs: [
                      BootstrapColumnConfig(
                        name: 'renderingEngine',
                        label: Text('Rendering engine'),
                        dataCell: (value) => DataCell(Text('$value')),
                      ),
                      BootstrapColumnConfig(
                        name: 'browser',
                        label: Text('Browser'),
                        dataCell: (value) => DataCell(Text('$value')),
                      ),
                      BootstrapColumnConfig(
                        name: 'platform',
                        label: Text('Platform(s)'),
                        dataCell: (value) => DataCell(Text('$value')),
                      ),
                      BootstrapColumnConfig(
                        name: 'engineVersion',
                        label: Text('Engine version'),
                        dataCell: (value) => DataCell(Text('$value')),
                      ),
                      BootstrapColumnConfig(
                        name: 'cssGrade',
                        label: Text('CSS grade'),
                        dataCell: (value) => DataCell(Text('$value')),
                        sortable: false,
                      ),
                    ],
                    rows: sampleDataRows1.map((row) => row.toMap()).toList(),
                  ),
                  horizontalMargin: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  final List<SampleData1> sampleDataRows1 = [
    SampleData1.fromList(
        ['Trident', 'Internet Explorer 4.0', 'Win 95+', '4', 'X']),
    SampleData1.fromList(
        ['Trident', 'Internet Explorer 5.0', 'Win 95+', '5', 'C']),
    SampleData1.fromList(
        ['Trident', 'Internet Explorer 5.5', 'Win 95+', '5.5', 'A']),
    SampleData1.fromList(
        ['Trident', 'Internet Explorer 6', 'Win 98+', '6', 'A']),
    SampleData1.fromList(
        ['Trident', 'Internet Explorer 7', 'Win XP SP2+', '7', 'A']),
    SampleData1.fromList(
        ['Trident', 'AOL browser (AOL desktop)', 'Win XP', '6', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Firefox 1.0', 'Win 98+ / OSX.2+', '1.7', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Firefox 1.5', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Firefox 2.0', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Firefox 3.0', 'Win 2k+ / OSX.3+', '1.9', 'A']),
    SampleData1.fromList(['Gecko', 'Camino 1.0', 'OSX.2+', '1.8', 'A']),
    SampleData1.fromList(['Gecko', 'Camino 1.5', 'OSX.3+', '1.8', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Netscape 7.2', 'Win 95+ / Mac OS 8.6-9.2', '1.7', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Netscape Browser 8', 'Win 98SE+', '1.7', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Netscape Navigator 9', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.0', 'Win 95+ / OSX.1+', '1', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.1', 'Win 95+ / OSX.1+', '1.1', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.2', 'Win 95+ / OSX.1+', '1.2', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.3', 'Win 95+ / OSX.1+', '1.3', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.4', 'Win 95+ / OSX.1+', '1.4', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.5', 'Win 95+ / OSX.1+', '1.5', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.6', 'Win 95+ / OSX.1+', '1.6', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.7', 'Win 98+ / OSX.1+', '1.7', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Mozilla 1.8', 'Win 98+ / OSX.1+', '1.8', 'A']),
    SampleData1.fromList(
        ['Gecko', 'Seamonkey 1.1', 'Win 98+ / OSX.2+', '1.8', 'A']),
    SampleData1.fromList(['Gecko', 'Epiphany 2.20', 'Gnome', '1.8', 'A']),
    SampleData1.fromList(['Webkit', 'Safari 1.2', 'OSX.3', '125.5', 'A']),
    SampleData1.fromList(['Webkit', 'Safari 1.3', 'OSX.3', '312.8', 'A']),
    SampleData1.fromList(['Webkit', 'Safari 2.0', 'OSX.4+', '419.3', 'A']),
    SampleData1.fromList(['Webkit', 'Safari 3.0', 'OSX.4+', '522.1', 'A']),
    SampleData1.fromList(['Webkit', 'OmniWeb 5.5', 'OSX.4+', '420', 'A']),
    SampleData1.fromList(
        ['Webkit', 'iPod Touch / iPhone', 'iPod', '420.1', 'A']),
    SampleData1.fromList(['Webkit', 'S60', 'S60', '413', 'A']),
    SampleData1.fromList(['Presto', 'Opera 7.0', 'Win 95+ / OSX.1+', '-', 'A']),
    SampleData1.fromList(['Presto', 'Opera 7.5', 'Win 95+ / OSX.2+', '-', 'A']),
    SampleData1.fromList(['Presto', 'Opera 8.0', 'Win 95+ / OSX.2+', '-', 'A']),
    SampleData1.fromList(['Presto', 'Opera 8.5', 'Win 95+ / OSX.2+', '-', 'A']),
    SampleData1.fromList(['Presto', 'Opera 9.0', 'Win 95+ / OSX.3+', '-', 'A']),
    SampleData1.fromList(['Presto', 'Opera 9.2', 'Win 88+ / OSX.3+', '-', 'A']),
    SampleData1.fromList(['Presto', 'Opera 9.5', 'Win 88+ / OSX.3+', '-', 'A']),
    SampleData1.fromList(['Presto', 'Opera for Wii', 'Wii', '-', 'A']),
    SampleData1.fromList(['Presto', 'Nokia N800', 'N800', '-', 'A']),
    SampleData1.fromList(
        ['Presto', 'Nintendo DS browser', 'Nintendo DS', '8.5', 'C/A']),
    SampleData1.fromList(['KHTML', 'Konqureror 3.1', 'KDE 3.1', '3.1', 'C']),
    SampleData1.fromList(['KHTML', 'Konqureror 3.3', 'KDE 3.3', '3.3', 'A']),
    SampleData1.fromList(['KHTML', 'Konqureror 3.5', 'KDE 3.5', '3.5', 'A']),
    SampleData1.fromList(
        ['Tasman', 'Internet Explorer 4.5', 'Mac OS 8-9', '-', 'X']),
    SampleData1.fromList(
        ['Tasman', 'Internet Explorer 5.1', 'Mac OS 7.6-9', '1', 'C']),
    SampleData1.fromList(
        ['Tasman', 'Internet Explorer 5.2', 'Mac OS 8-X', '1', 'C']),
    SampleData1.fromList(
        ['Misc', 'NetFront 3.1', 'Embedded devices', '-', 'C']),
    SampleData1.fromList(
        ['Misc', 'NetFront 3.4', 'Embedded devices', '-', 'A']),
    SampleData1.fromList(['Misc', 'Dillo 0.8', 'Embedded devices', '-', 'X']),
    SampleData1.fromList(['Misc', 'Links', 'Text only', '-', 'X']),
    SampleData1.fromList(['Misc', 'Lynx', 'Text only', '-', 'X']),
    SampleData1.fromList(['Misc', 'IE Mobile', 'Windows Mobile 6', '-', 'C']),
    SampleData1.fromList(['Misc', 'PSP browser', 'PSP', '-', 'C']),
  ];
}

class SampleData1 {
  SampleData1._({
    this.renderingEngine,
    this.browser,
    this.platform,
    this.engineVersion,
    this.cssGrade,
  });

  factory SampleData1.fromList(List<String> values) {
    return SampleData1._(
      renderingEngine: values[0],
      browser: values[1],
      platform: values[2],
      engineVersion: values[3],
      cssGrade: values[4],
    );
  }

  final String renderingEngine;
  final String browser;
  final String platform;
  final String engineVersion;
  final String cssGrade;

  Map<String, dynamic> toMap() {
    return {
      'renderingEngine': renderingEngine,
      'browser': browser,
      'platform': platform,
      'engineVersion': engineVersion,
      'cssGrade': cssGrade,
    };
  }
}
