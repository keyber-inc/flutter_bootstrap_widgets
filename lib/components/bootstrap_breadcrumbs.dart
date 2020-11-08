import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/components/bootstrap_colors.dart';

class BootstrapBreadcrumbs extends StatelessWidget {
  const BootstrapBreadcrumbs({
    @required this.children,
  });

  final List<BootstrapBreadcrumbsItem> children;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (BootstrapBreadcrumbsItem item in children) {
      items.add(_buildItemText(item));
      if (children.last != item) {
        items.add(_buildSeparation());
      }
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: BootstrapColors.defaults,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Wrap(
          children: items,
        ),
      ),
    );
  }

  Widget _buildItemText(BootstrapBreadcrumbsItem item) {
    final color = item.onTap != null
        ? BootstrapColors.anchorText
        : item.active
            ? BootstrapColors.breadcrumbsItemActiveText
            : BootstrapColors.breadcrumbsItemDefaultText;

    return InkWell(
      onTap: item.onTap,
      child: Wrap(
        children: [
          item.icon != null
              ? Icon(
                  item.icon,
                  size: 17,
                  color: color,
                )
              : SizedBox(),
          Text(
            item.text,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        '/',
        style: TextStyle(
          color: BootstrapColors.breadcrumbsSeparation,
        ),
      ),
    );
  }
}

class BootstrapBreadcrumbsItem {
  const BootstrapBreadcrumbsItem({
    @required this.text,
    this.icon,
    this.onTap,
    this.active = false,
  });

  final String text;
  final bool active;
  final VoidCallback onTap;
  final IconData icon;
}
