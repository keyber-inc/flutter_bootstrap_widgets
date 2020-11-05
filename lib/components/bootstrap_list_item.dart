import 'package:flutter/material.dart';

import 'bootstrap_list.dart';

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
