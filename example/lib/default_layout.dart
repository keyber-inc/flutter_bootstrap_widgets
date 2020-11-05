import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/flutter_admin_scaffold.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/components/bootstrap_colors.dart';
import 'package:flutter_bootstrap_widgets_example/pages/top_page.dart';

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
