import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/flutter_bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class ButtonsPage extends StatelessWidget {
  static const route = '/buttons';
  static const title = 'Buttons';

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
              sizes: 'col-lg-6',
              child: BootstrapPanel(
                header: SelectableText('Default Buttons'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapHeading.h4(
                      child: SelectableText('Normal Buttons'),
                    ),
                    BootstrapParagraphs(
                      child: Wrap(
                        spacing: 4,
                        children: [
                          BootstrapButton(
                            child: Text('Default'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Primary'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.success,
                            child: Text('Success'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.info,
                            child: Text('Info'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.warning,
                            child: Text('Warning'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.danger,
                            child: Text('Danger'),
                            onPressed: () => print('onPressed'),
                          ),
                        ],
                      ),
                    ),
                    BootstrapHeading.h4(
                      child: SelectableText('Disabled Buttons'),
                    ),
                    BootstrapParagraphs(
                      child: Wrap(
                        spacing: 4,
                        children: [
                          BootstrapButton(
                            child: Text('Default'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Primary'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.success,
                            child: Text('Success'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.info,
                            child: Text('Info'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.warning,
                            child: Text('Warning'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.danger,
                            child: Text('Danger'),
                          ),
                        ],
                      ),
                    ),
                    BootstrapHeading.h4(
                      child: SelectableText('Button Sizes'),
                    ),
                    BootstrapParagraphs(
                      child: Wrap(
                        spacing: 4,
                        children: [
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.large,
                            child: Text('Large button'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Default button'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.small,
                            child: Text('Small button'),
                            onPressed: () => print('onPressed'),
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.mini,
                            child: Text('Mini button'),
                            onPressed: () => print('onPressed'),
                          ),
                        ],
                      ),
                    ),
                    BootstrapParagraphs(
                      child: Expanded(
                        child: BootstrapButton(
                          type: BootstrapButtonType.primary,
                          size: BootstrapButtonSize.large,
                          child: Text('Block level button'),
                          onPressed: () => print('onPressed'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BootstrapCol(
              sizes: 'col-lg-6',
              child: BootstrapPanel(
                header:
                    SelectableText('Outline Buttons with Smooth Transition'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapHeading.h4(
                      child: SelectableText('Outline Buttons'),
                    ),
                    BootstrapParagraphs(
                      child: Wrap(
                        spacing: 4,
                        children: [
                          BootstrapButton(
                            child: Text('Default'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Primary'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.success,
                            child: Text('Success'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.info,
                            child: Text('Info'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.warning,
                            child: Text('Warning'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.danger,
                            child: Text('Danger'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                        ],
                      ),
                    ),
                    BootstrapHeading.h4(
                      child: SelectableText('Outline Button Sizes'),
                    ),
                    BootstrapParagraphs(
                      child: Wrap(
                        spacing: 4,
                        children: [
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.large,
                            child: Text('Large button'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Default button'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.small,
                            child: Text('Small button'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.mini,
                            child: Text('Mini button'),
                            onPressed: () => print('onPressed'),
                            outline: true,
                          ),
                        ],
                      ),
                    ),
                    BootstrapParagraphs(
                      child: Expanded(
                        child: BootstrapButton(
                          type: BootstrapButtonType.primary,
                          size: BootstrapButtonSize.large,
                          child: Text('Block level button'),
                          onPressed: () => print('onPressed'),
                          outline: true,
                        ),
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
