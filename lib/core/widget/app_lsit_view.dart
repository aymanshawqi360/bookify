import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final int? itemCount;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final bool? shrinkWrap;
  final Widget? Function(BuildContext, int) itemBuilder;

  const AppListView({
    super.key,
    this.itemCount,
    this.padding,
    this.physics,
    this.scrollDirection,
    this.shrinkWrap,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection ?? Axis.vertical,
      physics: physics,
      padding: padding,
      itemCount: itemCount,
      shrinkWrap: shrinkWrap ?? false,
      itemBuilder: itemBuilder,
    );
  }
}
