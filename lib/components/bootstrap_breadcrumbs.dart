import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/components/bootstrap_colors.dart';

class BootstrapBreadcrumbs extends StatelessWidget {
  const BootstrapBreadcrumbs({
    @required this.children,
    this.isExpanded = false,
  });

  final List<BootstrapBreadcrumbsItem> children;
  final bool isExpanded;

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
        width: double.infinity,
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
    final color = item.url != null
        ? BootstrapColors.anchorText
        : item.active
            ? BootstrapColors.breadcrumbsItemActiveText
            : BootstrapColors.breadcrumbsItemDefaultText;
    final text = Wrap(
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
    );

    if (item.url == null) {
      return text;
    }
    return InkWell(
      onTap: () {
        if (item.onTap != null) {
          item.onTap(item.url);
        }
      },
      child: text,
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
    this.url,
    this.onTap,
    this.active = false,
  });

  final String text;
  final String url;
  final bool active;
  final Function(String url) onTap;
  final IconData icon;
}
