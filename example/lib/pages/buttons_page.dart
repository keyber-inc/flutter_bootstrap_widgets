import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class ButtonsPage extends StatelessWidget {
  static const route = '/buttons';
  static const title = 'Buttons';

  final VoidCallback _onPressed = () {
    print('onPressed');
  };

  final VoidCallback _onLongPressed = () {
    print('onLongPressed');
  };

  final ValueChanged<bool> _onHover = (value) {
    print('onHover: $value');
  };

  final ValueChanged<bool> _onFocusChange = (value) {
    print('onFocusChange: $value');
  };

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
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Primary'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.success,
                            child: Text('Success'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.info,
                            child: Text('Info'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.warning,
                            child: Text('Warning'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.danger,
                            child: Text('Danger'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
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
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Default button'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.small,
                            child: Text('Small button'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.mini,
                            child: Text('Mini button'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                          ),
                        ],
                      ),
                    ),
                    BootstrapParagraphs(
                      child: BootstrapButton(
                        type: BootstrapButtonType.primary,
                        size: BootstrapButtonSize.large,
                        child: Text('Block level button'),
                        onPressed: _onPressed,
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
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Primary'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.success,
                            child: Text('Success'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.info,
                            child: Text('Info'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.warning,
                            child: Text('Warning'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.danger,
                            child: Text('Danger'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
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
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            child: Text('Default button'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.small,
                            child: Text('Small button'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                          BootstrapButton(
                            type: BootstrapButtonType.primary,
                            size: BootstrapButtonSize.mini,
                            child: Text('Mini button'),
                            onPressed: _onPressed,
                            onLongPress: _onLongPressed,
                            onHover: _onHover,
                            onFocusChange: _onFocusChange,
                            outline: true,
                          ),
                        ],
                      ),
                    ),
                    BootstrapParagraphs(
                      child: BootstrapButton(
                        type: BootstrapButtonType.primary,
                        size: BootstrapButtonSize.large,
                        child: Text('Block level button'),
                        onPressed: _onPressed,
                        outline: true,
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
