import 'package:flutter/material.dart';

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

// ignore: must_be_immutable
class BootstrapListItem extends StatelessWidget {
  BootstrapListItem({
    @required this.child,
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
    Widget bullet;
    switch (type) {
      case BootstrapListType.unordered:
        bullet = _buildBulletBlack();
        break;
      case BootstrapListType.ordered:
        bullet = _buildOrdered(index);
        break;
      case BootstrapListType.unstyled:
        break;
    }
    if (bullet == null) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.only(left: 12),
      child: bullet,
    );
  }

  // 黒い丸
  Widget _buildBulletBlack() {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: CircleAvatar(
        radius: 2.0,
        backgroundColor: Colors.black,
      ),
    );
  }

  // 数字
  Widget _buildOrdered(int index) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '${index + 1}.  ',
      ),
    );
  }
}
