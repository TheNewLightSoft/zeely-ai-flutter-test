import 'package:flutter/material.dart';

class MaxWidth extends StatelessWidget {
  const MaxWidth({super.key, required this.child, this.max = 520});

  final Widget child;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: max),
        child: child,
      ),
    );
  }
}
