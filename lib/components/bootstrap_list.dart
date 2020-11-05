import 'package:flutter/material.dart';

import 'bootstrap_list_item.dart';

class BootstrapList extends StatelessWidget {
  const BootstrapList.unordered({
    this.children,
  }) : type = BootstrapListType.unordered;

  const BootstrapList.ordered({
    this.children,
  }) : type = BootstrapListType.ordered;

  const BootstrapList.unstyled({
    this.children,
  }) : type = BootstrapListType.unstyled;

  final List<BootstrapListItem> children;
  final BootstrapListType type;

  @override
  Widget build(BuildContext context) {
    children.asMap().forEach((index, child) {
      child.type = type;
      child.index = index;
    });
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: children,
      ),
    );
  }
}

enum BootstrapListType {
  unordered,
  ordered,
  unstyled,
}
