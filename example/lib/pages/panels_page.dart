import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class PanelsPage extends StatelessWidget {
  static const route = '/panels';
  static const title = 'Panels';

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
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                header: SelectableText('Default Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.primary,
                header: SelectableText('Primary Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.info,
                header: SelectableText('Info Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
          ],
        ),
        BootstrapRow(
          height: 0,
          children: [
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.success,
                header: SelectableText('Success Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.warning,
                header: SelectableText('Warning Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.danger,
                header: SelectableText('Danger Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
          ],
        ),
        BootstrapRow(
          height: 0,
          children: [
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.green,
                header: SelectableText('Green Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.yellow,
                header: SelectableText('Yellow Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                type: BootstrapPanelType.red,
                header: SelectableText('Red Panel'),
                body: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
                ),
                footer: SelectableText('Panel Footer'),
              ),
            ),
          ],
        ),
        BootstrapRow(
          height: 0,
          children: [
            BootstrapCol(
              sizes: 'col-xl-12',
              child: BootstrapPanel(
                header: SelectableText('Body Padding'),
                body: Column(
                  children: [
                    BootstrapPanel(
                      padding: const EdgeInsets.all(0),
                      header: SelectableText(
                        'none',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      body: SelectableText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.',
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
