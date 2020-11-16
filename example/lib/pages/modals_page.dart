import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class ModalsPage extends StatelessWidget {
  static const route = '/modals';
  static const title = 'Modals';

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
                header: SelectableText('Modals'),
                body: BootstrapParagraphs(
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [
                      BootstrapButton(
                        child: Text('Launch Demo Large Modal'),
                        type: BootstrapButtonType.primary,
                        size: BootstrapButtonSize.large,
                        onPressed: () async {
                          await _showModal(context, BootstrapModalSize.large);
                        },
                      ),
                      BootstrapButton(
                        child: Text('Launch Demo Medium Modal'),
                        type: BootstrapButtonType.primary,
                        size: BootstrapButtonSize.large,
                        onPressed: () async {
                          await _showModal(context, BootstrapModalSize.medium);
                        },
                      ),
                      BootstrapButton(
                        child: Text('Launch Demo Small Modal'),
                        type: BootstrapButtonType.primary,
                        size: BootstrapButtonSize.large,
                        onPressed: () async {
                          await _showModal(context, BootstrapModalSize.small);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future _showModal(context, BootstrapModalSize size) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return BootstrapModal(
          size: size,
          dismissble: true,
          title: Text('Modal title'),
          content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
          actions: [
            BootstrapButton(
              type: BootstrapButtonType.defaults,
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BootstrapButton(
              type: BootstrapButtonType.primary,
              child: Text('Save changes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
