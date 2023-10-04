

// harm_index_indicator.dart
import 'package:flutter/material.dart';

class HarmIndexIndicator extends StatelessWidget {
  final double harmIndex;

  const HarmIndexIndicator({super.key, required this.harmIndex});

  Color _determineColor() {
    if (harmIndex < 3.3) return Colors.green;
    if (harmIndex < 6.6) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 10,
      color: _determineColor(),
    );
  }
}
