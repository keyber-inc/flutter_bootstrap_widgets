import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class BreadcrumbsPage extends StatelessWidget {
  static const route = '/breadcrumbs';
  static const title = 'Breadcrumbs';

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
                header: SelectableText('Breadcrumbs'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapLabelText(
                      child: Text("Default"),
                    ),
                    BootstrapBreadcrumbs(
                      children: [
                        BootstrapBreadcrumbsItem(
                          text: 'Bootstrap3',
                          onTap: () {
                            print('onTap()');
                          },
                        ),
                        BootstrapBreadcrumbsItem(
                          text: 'Component',
                          onTap: () {
                            print('onTap()');
                          },
                        ),
                        BootstrapBreadcrumbsItem(
                          text: 'Breadcrumbs',
                          active: true,
                        ),
                      ],
                    ),
                    BootstrapLabelText(
                      child: Text("With Icon"),
                    ),
                    BootstrapBreadcrumbs(
                      children: [
                        BootstrapBreadcrumbsItem(
                          text: 'Bootstrap3',
                          icon: Icons.home,
                          onTap: () {
                            print('onTap()');
                          },
                        ),
                        BootstrapBreadcrumbsItem(
                          text: 'Component',
                          onTap: () {
                            print('onTap()');
                          },
                        ),
                        BootstrapBreadcrumbsItem(
                          text: 'Breadcrumbs',
                          active: true,
                        ),
                      ],
                    ),
                    BootstrapLabelText(
                      child: Text("No Actions"),
                    ),
                    BootstrapBreadcrumbs(
                      children: [
                        BootstrapBreadcrumbsItem(
                          text: 'Bootstrap3',
                          icon: Icons.home,
                        ),
                        BootstrapBreadcrumbsItem(
                          text: 'Component',
                        ),
                        BootstrapBreadcrumbsItem(
                          text: 'Breadcrumbs',
                        ),
                      ],
                    ),
                    BootstrapLabelText(
                      child: Text(
                          "White backgroundColor, zero margin and padding"),
                    ),
                    Container(
                      child: BootstrapBreadcrumbs(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        children: [
                          BootstrapBreadcrumbsItem(
                            text: 'Bootstrap3',
                            icon: Icons.home,
                            onTap: () {
                              print('onTap()');
                            },
                          ),
                          BootstrapBreadcrumbsItem(
                            text: 'Component',
                            onTap: () {
                              print('onTap()');
                            },
                          ),
                          BootstrapBreadcrumbsItem(
                            text: 'Breadcrumbs',
                            active: true,
                          ),
                        ],
                      ),
                    ),
                    BootstrapLabelText(
                      child: Text("Expanded"),
                    ),
                    Container(
                      width: double.infinity,
                      child: BootstrapBreadcrumbs(
                        children: [
                          BootstrapBreadcrumbsItem(
                            text: 'Bootstrap3',
                            icon: Icons.home,
                            onTap: () {
                              print('onTap()');
                            },
                          ),
                          BootstrapBreadcrumbsItem(
                            text: 'Component',
                            onTap: () {
                              print('onTap()');
                            },
                          ),
                          BootstrapBreadcrumbsItem(
                            text: 'Breadcrumbs',
                            active: true,
                          ),
                        ],
                      ),
                    ),
                    BootstrapLabelText(
                      child: Text("Large"),
                    ),
                    Container(
                      child: BootstrapBreadcrumbs(
                        iconSize: 24,
                        fontSize: 20,
                        children: [
                          BootstrapBreadcrumbsItem(
                            text: 'Bootstrap3',
                            icon: Icons.home,
                            onTap: () {
                              print('onTap()');
                            },
                          ),
                          BootstrapBreadcrumbsItem(
                            text: 'Component',
                            onTap: () {
                              print('onTap()');
                            },
                          ),
                          BootstrapBreadcrumbsItem(
                            text: 'Breadcrumbs',
                            active: true,
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
