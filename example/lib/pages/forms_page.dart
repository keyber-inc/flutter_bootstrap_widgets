import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/flutter_bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class FormsPage extends StatelessWidget {
  static const route = '/forms';
  static const title = 'Forms';

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
              sizes: 'col-xl-12',
              child: BootstrapPanel(
                header: SelectableText('Basic Form Elements'),
                body: BootstrapRow(
                  height: 0,
                  children: [
                    BootstrapCol(
                      sizes: 'col-xl-6 col-lg-12',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Text Input'),
                              ),
                              TextFormField(
                                decoration: BootstrapInputDecoration(
                                  helperText:
                                      'Example block-level help text here.',
                                ),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText(
                                    'Text Input with Placeholder'),
                              ),
                              TextFormField(
                                decoration: BootstrapInputDecoration(
                                  hintText: 'Enter Text',
                                ),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Static Control'),
                              ),
                              BootstrapParagraphs(
                                child: SelectableText('email@example.com'),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Text area'),
                              ),
                              TextFormField(
                                maxLines: 3,
                                decoration: BootstrapInputDecoration(),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Checkboxes'),
                              ),
                              BootstrapCheckbox(
                                label: Text('Checkbox 1'),
                                onChanged: (value) {
                                  print('Checkbox 1: $value');
                                },
                              ),
                              BootstrapCheckbox(
                                label: Text('Checkbox 2'),
                                onChanged: (value) {
                                  print('Checkbox 2: $value');
                                },
                              ),
                              BootstrapCheckbox(
                                label: Text('Checkbox 3'),
                                value: true,
                                onChanged: (value) {
                                  print('Checkbox 3: $value');
                                },
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            direction: Axis.horizontal,
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Inline Checkboxes'),
                              ),
                              BootstrapCheckbox(
                                label: Text('1'),
                                onChanged: (value) {
                                  print('Checkbox 1: $value');
                                },
                              ),
                              BootstrapCheckbox(
                                label: Text('2'),
                                onChanged: (value) {
                                  print('Checkbox 2: $value');
                                },
                              ),
                              BootstrapCheckbox(
                                label: Text('3'),
                                value: true,
                                onChanged: (value) {
                                  print('Checkbox 3: $value');
                                },
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Radio Buttons'),
                              ),
                              BootstrapRadio(
                                groupValue: '3',
                                value: '1',
                                label: Text('Radio 1'),
                                onChanged: (value) {
                                  print('Radio 1: $value');
                                },
                              ),
                              BootstrapRadio(
                                groupValue: '3',
                                value: '2',
                                label: Text('Radio 2'),
                                onChanged: (value) {
                                  print('Radio 2: $value');
                                },
                              ),
                              BootstrapRadio(
                                groupValue: '3',
                                value: '3',
                                label: Text('Radio 3'),
                                onChanged: (value) {
                                  print('Radio 3: $value');
                                },
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            direction: Axis.horizontal,
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Inline Radio Buttons'),
                              ),
                              BootstrapRadio(
                                groupValue: '3',
                                value: '1',
                                label: Text('1'),
                                onChanged: (value) {
                                  print('Radio 1: $value');
                                },
                              ),
                              BootstrapRadio(
                                groupValue: '3',
                                value: '2',
                                label: Text('2'),
                                onChanged: (value) {
                                  print('Radio 2: $value');
                                },
                              ),
                              BootstrapRadio(
                                groupValue: '3',
                                value: '3',
                                label: Text('3'),
                                onChanged: (value) {
                                  print('Radio 3: $value');
                                },
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Selects'),
                              ),
                              BootstrapSelect(
                                value: 1,
                                options: [
                                  BootstrapOption(name: '1', value: 1),
                                  BootstrapOption(name: '2', value: 2),
                                  BootstrapOption(name: '3', value: 3),
                                  BootstrapOption(name: '4', value: 4),
                                  BootstrapOption(name: '5', value: 5),
                                ],
                                onChanged: (newValue) {
                                  print('Select: $newValue');
                                },
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Multiple Selects'),
                              ),
                              BootstrapMultiSelect(
                                values: [5, 7],
                                options: [
                                  BootstrapOption(name: '1', value: 1),
                                  BootstrapOption(name: '2', value: 2),
                                  BootstrapOption(name: '3', value: 3),
                                  BootstrapOption(name: '4', value: 4),
                                  BootstrapOption(name: '5', value: 5),
                                  BootstrapOption(name: '6', value: 6),
                                  BootstrapOption(name: '7', value: 7),
                                  BootstrapOption(name: '8', value: 8),
                                  BootstrapOption(name: '9', value: 9),
                                  BootstrapOption(name: '10', value: 10),
                                ],
                                onChanged: (values) {
                                  print('Multiselect: $values');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-xl-6 col-lg-12',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BootstrapHeading.h1(
                            child: SelectableText('Disabled Form States'),
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Disabled Input'),
                              ),
                              TextFormField(
                                enabled: false,
                                decoration: BootstrapInputDecoration(
                                  hintText: 'Disabled input',
                                  enabled: false,
                                ),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Disabled select menu'),
                              ),
                              BootstrapSelect(
                                enabled: false,
                                value: 1,
                                options: [
                                  BootstrapOption(
                                      name: 'Disabled select', value: 1),
                                  BootstrapOption(name: '2', value: 2),
                                  BootstrapOption(name: '3', value: 3),
                                  BootstrapOption(name: '4', value: 4),
                                  BootstrapOption(name: '5', value: 5),
                                ],
                                onChanged: (newValue) {
                                  print('Select: $newValue');
                                },
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapCheckbox(
                                enabled: false,
                                label: Text('Disabled Checkbox'),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              BootstrapButton(
                                type: BootstrapButtonType.primary,
                                child: Text('Disabled Button'),
                              ),
                            ],
                          ),
                          BootstrapHeading.h1(
                            child: SelectableText('Form Validation States'),
                          ),
                          BootstrapFormGroup(
                            type: BootstrapFormGroupType.success,
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Input with success'),
                              ),
                              TextFormField(
                                decoration: BootstrapInputDecoration(),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            type: BootstrapFormGroupType.warning,
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Input with warning'),
                              ),
                              TextFormField(
                                decoration: BootstrapInputDecoration(),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            type: BootstrapFormGroupType.error,
                            children: [
                              BootstrapLabelText(
                                child: SelectableText('Input with error'),
                              ),
                              TextFormField(
                                decoration: BootstrapInputDecoration(),
                              ),
                            ],
                          ),
                          BootstrapHeading.h1(
                            child: SelectableText('Input Groups'),
                          ),
                          BootstrapFormGroup(
                            children: [
                              TextFormField(
                                decoration: BootstrapInputDecoration(
                                  prefixIcon: Icon(Icons.alternate_email),
                                  hintText: 'Username',
                                ),
                              ),
                            ],
                          ),
                          BootstrapFormGroup(
                            children: [
                              TextFormField(
                                decoration: BootstrapInputDecoration(
                                  suffix: Text('.00'),
                                ),
                              ),
                            ],
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
