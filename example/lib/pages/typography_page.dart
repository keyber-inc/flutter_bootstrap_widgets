import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class TypographyPage extends StatelessWidget {
  static const route = '/typography';
  static const title = 'Typography';

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
                header: SelectableText('Headings'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        BootstrapHeading.h1(
                          child: SelectableText('Heading 1'),
                        ),
                        BootstrapHeading.h1(
                          child: SelectableText('Sub-Heading'),
                          type: BootstrapHeadingType.small,
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        BootstrapHeading.h2(
                          child: SelectableText('Heading 2'),
                        ),
                        BootstrapHeading.h2(
                          child: SelectableText('Sub-Heading'),
                          type: BootstrapHeadingType.small,
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        BootstrapHeading.h3(
                          child: SelectableText('Heading 3'),
                        ),
                        BootstrapHeading.h3(
                          child: SelectableText('Sub-Heading'),
                          type: BootstrapHeadingType.small,
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        BootstrapHeading.h4(
                          child: SelectableText('Heading 4'),
                        ),
                        BootstrapHeading.h4(
                          child: SelectableText('Sub-Heading'),
                          type: BootstrapHeadingType.small,
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        BootstrapHeading.h5(
                          child: SelectableText('Heading 5'),
                        ),
                        BootstrapHeading.h5(
                          child: SelectableText('Sub-Heading'),
                          type: BootstrapHeadingType.small,
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        BootstrapHeading.h6(
                          child: SelectableText('Heading 6'),
                        ),
                        BootstrapHeading.h6(
                          child: SelectableText('Sub-Heading'),
                          type: BootstrapHeadingType.small,
                        ),
                      ],
                    ),
                    BootstrapHeading.h1(
                      child: SelectableText('PageHeader'),
                      type: BootstrapHeadingType.pageHeader,
                      borderColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                header: SelectableText('Paragraphs'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapParagraphs(
                      lead: true,
                      child: SelectableText(
                          'This is an example of lead body copy.'),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of small, fine print text.',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of strong, bold text.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of emphasized, italic text.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    BootstrapHeading.h4(
                      child: SelectableText('Alignment Helpers'),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'Left aligned text.',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'Center aligned text.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'Right aligned text.',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                header: SelectableText('Emphasis Classes'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of muted text.',
                        style: TextStyle(
                          color: BootstrapColors.muted,
                        ),
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of primary text.',
                        style: TextStyle(
                          color: BootstrapColors.primary,
                        ),
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of success text.',
                        style: TextStyle(
                          color: BootstrapColors.success,
                        ),
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of info text.',
                        style: TextStyle(
                          color: BootstrapColors.info,
                        ),
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of warning text.',
                        style: TextStyle(
                          color: BootstrapColors.warning,
                        ),
                      ),
                    ),
                    BootstrapParagraphs(
                      child: SelectableText(
                        'This is an example of danger text.',
                        style: TextStyle(
                          color: BootstrapColors.danger,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BootstrapCol(
              sizes: 'col-xl-4 col-lg-12',
              child: BootstrapPanel(
                header: SelectableText('Lists'),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootstrapHeading.h4(
                      child: SelectableText('Unordered List'),
                    ),
                    BootstrapList.unordered(
                      children: [
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                      ],
                    ),
                    BootstrapHeading.h4(
                      child: SelectableText('Ordered List'),
                    ),
                    BootstrapList.ordered(
                      children: [
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                      ],
                    ),
                    BootstrapHeading.h4(
                      child: SelectableText('Unstyled List'),
                    ),
                    BootstrapList.unstyled(
                      children: [
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                        BootstrapListItem(
                          child: SelectableText('List Item'),
                        ),
                        BootstrapListItem(
                          child: SelectableText('List Item'),
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
