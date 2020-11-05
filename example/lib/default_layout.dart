import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/flutter_admin_scaffold.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/components/bootstrap_colors.dart';
import 'package:flutter_bootstrap_widgets_example/pages/alerts_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/buttons_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/forms_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/icons_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/modals_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/panels_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/tables_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/top_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/typography_page.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    Key key,
    @required this.route,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;
  final String route;

  final List<MenuItemData> _sidebarItemDatas = const [
    MenuItemData(
      title: TopPage.title,
      route: TopPage.route,
      icon: Icons.dashboard,
    ),
    MenuItemData(
      title: 'CSS',
      icon: Icons.edit,
      children: [
        MenuItemData(
          title: TypographyPage.title,
          route: TypographyPage.route,
        ),
        MenuItemData(
          title: TablesPage.title,
          route: TablesPage.route,
        ),
        MenuItemData(
          title: FormsPage.title,
          route: FormsPage.route,
        ),
        MenuItemData(
          title: ButtonsPage.title,
          route: ButtonsPage.route,
        ),
      ],
    ),
    MenuItemData(
      title: 'Components',
      icon: Icons.settings,
      children: [
        MenuItemData(
          title: IconsPage.title,
          route: IconsPage.route,
        ),
        MenuItemData(
          title: AlertsPage.title,
          route: AlertsPage.route,
        ),
        MenuItemData(
          title: ModalsPage.title,
          route: ModalsPage.route,
        ),
        MenuItemData(
          title: PanelsPage.title,
          route: PanelsPage.route,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      sidebar: Sidebar(
        itemDatas: _sidebarItemDatas,
        selectedRoute: route,
        onSelected: (itemData) {
          print(
              'sidebar: onTap(): title = ${itemData.title}, route = ${itemData.route}');
          if (itemData.route != null && itemData.route != route) {
            Navigator.of(context).pushNamed(itemData.route);
          }
        },
      ),
      body: BootstrapContainer(
        fluid: true,
        decoration: BoxDecoration(
          color: BootstrapColors.bodyBackground,
        ),
        children: children,
      ),
    );
  }
}
