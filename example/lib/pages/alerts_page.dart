import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class AlertsPage extends StatelessWidget {
  static const route = '/alerts';
  static const title = 'Alerts';

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
              sizes: 'col-xl-6 col-lg-12',
              child: BootstrapPanel(
                header: SelectableText('Alert Styles'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapAlert(
                      type: BootstrapAlertType.success,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BootstrapAlert(
                      type: BootstrapAlertType.info,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BootstrapAlert(
                      type: BootstrapAlertType.warning,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BootstrapAlert(
                      type: BootstrapAlertType.danger,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-6 col-lg-12',
              child: BootstrapPanel(
                header: SelectableText('Dismissble Alerts'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapAlert(
                      type: BootstrapAlertType.success,
                      dismissble: true,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BootstrapAlert(
                      type: BootstrapAlertType.info,
                      dismissble: true,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BootstrapAlert(
                      type: BootstrapAlertType.warning,
                      dismissble: true,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BootstrapAlert(
                      type: BootstrapAlertType.danger,
                      dismissble: true,
                      child: Row(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit. '),
                          Text(
                            'Alert Link.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
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
