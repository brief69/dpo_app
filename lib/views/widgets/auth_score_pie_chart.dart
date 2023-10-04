

// auth_score_pie_chart.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AuthScorePieChart extends StatelessWidget {
  final int authscore;  // 例えば、5 (8項目中5項目を満たしている)

  const AuthScorePieChart({super.key, required this.authscore});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: authscore.toDouble(),
            color: Colors.green,
            title: '$authscore/8',
          ),
          PieChartSectionData(
            value: (8 - authscore).toDouble(),
            color: Colors.grey[300]!,
            title: '',
          ),
        ],
        sectionsSpace: 0,
      ),
    );
  }
}
