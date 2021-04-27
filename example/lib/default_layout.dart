import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/pages/alerts_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/breadcrumbs_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/buttons_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/forms_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/icons_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/labels_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/modals_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/panels_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/top_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/typography_page.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    Key? key,
    required this.route,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  final String route;

  final List<MenuItem> _sidebarItemDatas = const [
    MenuItem(
      title: TopPage.title,
      route: TopPage.route,
      icon: Icons.dashboard,
    ),
    MenuItem(
      title: 'CSS',
      icon: Icons.edit,
      children: [
        MenuItem(
          title: TypographyPage.title,
          route: TypographyPage.route,
        ),
        MenuItem(
          title: FormsPage.title,
          route: FormsPage.route,
        ),
        MenuItem(
          title: ButtonsPage.title,
          route: ButtonsPage.route,
        ),
      ],
    ),
    MenuItem(
      title: 'Components',
      icon: Icons.settings,
      children: [
        MenuItem(
          title: IconsPage.title,
          route: IconsPage.route,
        ),
        MenuItem(
          title: BreadcrumbsPage.title,
          route: BreadcrumbsPage.route,
        ),
        MenuItem(
          title: LabelsPage.title,
          route: LabelsPage.route,
        ),
        MenuItem(
          title: AlertsPage.title,
          route: AlertsPage.route,
        ),
        MenuItem(
          title: ModalsPage.title,
          route: ModalsPage.route,
        ),
        MenuItem(
          title: PanelsPage.title,
          route: PanelsPage.route,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: BootstrapColors.bodyBackground,
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      sideBar: SideBar(
        items: _sidebarItemDatas,
        selectedRoute: route,
        onSelected: (itemData) {
          print(
              'sidebar: onTap(): title = ${itemData.title}, route = ${itemData.route}');
          if (itemData.route != null && itemData.route != route) {
            Navigator.of(context).pushNamed(itemData.route!);
          }
        },
      ),
      body: BootstrapContainer(
        fluid: true,
        children: children,
      ),
    );
  }
}
