import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProductivityTrendChart extends StatelessWidget {
  const ProductivityTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // adjust height
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          // remove background grid
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // hide Y axis
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                interval: 1,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  );
                  switch (value.toInt()) {
                    case 0:
                      return const Text("Sat", style: style);
                    case 1:
                      return const Text("Sun", style: style);
                    case 2:
                      return const Text("Mon", style: style);
                    case 3:
                      return const Text("Tue", style: style);
                    case 4:
                      return const Text("Wed", style: style);
                    case 5:
                      return const Text("Thu", style: style);
                    case 6:
                      return const Text("Fri", style: style);
                  }
                  return const Text("");
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          // remove border
          lineBarsData: [
            LineChartBarData(
              isCurved: false,
              barWidth: 2,
              color: Colors.black,
              dotData: FlDotData(show: false),
              // hide dots
              spots: const [
                FlSpot(0, 3),
                FlSpot(1, 5),
                FlSpot(2, 2),
                FlSpot(3, 4),
                FlSpot(4, 2.5),
                FlSpot(5, 5),
                FlSpot(6, 3),
              ],
            ),
          ],
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 6,
        ),
      ),
    );
  }
}
