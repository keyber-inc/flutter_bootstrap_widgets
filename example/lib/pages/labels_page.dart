import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class LabelsPage extends StatelessWidget {
  static const route = '/labels';
  static const title = 'Labels';

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
                header: SelectableText('Labels'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapFormGroup(
                      children: [
                        BootstrapLabelText(
                          child: Text("Colors"),
                        ),
                        Wrap(
                          children: [
                            BootstrapLabel(
                              text: 'New',
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.primary,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.success,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.info,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.warning,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.danger,
                            ),
                          ],
                        ),
                      ],
                    ),
                    BootstrapFormGroup(
                      children: [
                        BootstrapLabelText(
                          child: Text("Sizes"),
                        ),
                        Wrap(
                          children: [
                            BootstrapLabel(
                              text: 'New',
                              fontSize: 36,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.primary,
                              fontSize: 30,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.success,
                              fontSize: 24,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.info,
                              fontSize: 18,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.warning,
                              fontSize: 12,
                            ),
                            BootstrapLabel(
                              text: 'New',
                              type: BootstrapLabelType.danger,
                              fontSize: 6,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
