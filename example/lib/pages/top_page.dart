import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/components/bootstrap_heading.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class TopPage extends StatelessWidget {
  static const route = '/';
  static const title = 'Top';

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
                child: SelectableText('flutter_bootstrap_widgets'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('A bundle of Bootstrap 3 style widgets.'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
