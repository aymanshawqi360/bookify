import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          log(constraints.maxWidth.toString());
          return Container(color: Colors.red);
        } else {
          log(constraints.maxWidth.toString());
          return Container(color: Colors.blue);
        }
      },
    );
  }
}
