import 'package:flutter/material.dart';

class BootstrapList extends StatelessWidget {
  const BootstrapList.unordered({
    required this.children,
  }) : type = BootstrapListType.unordered;

  const BootstrapList.ordered({
    required this.children,
  }) : type = BootstrapListType.ordered;

  const BootstrapList.unstyled({
    required this.children,
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

// ignore: must_be_immutable
class BootstrapListItem extends StatelessWidget {
  BootstrapListItem({
    required this.child,
  });

  final Widget child;
  BootstrapListType type = BootstrapListType.unordered;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildBullet(type, index),
        child,
      ],
    );
  }

  Widget _buildBullet(BootstrapListType type, int index) {
    switch (type) {
      case BootstrapListType.unordered:
        // 黒い丸
        return const Padding(
          padding: const EdgeInsets.only(left: 24, right: 12),
          child: CircleAvatar(
            radius: 2.0,
            backgroundColor: Colors.black,
          ),
        );
      case BootstrapListType.ordered:
        // 数字
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            '${index + 1}.  ',
          ),
        );
      case BootstrapListType.unstyled:
        break;
    }
    return const SizedBox();
  }
}
