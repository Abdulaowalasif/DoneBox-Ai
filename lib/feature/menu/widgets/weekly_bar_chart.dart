import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBarChart extends StatelessWidget {
  const WeeklyBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 4,
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 28),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = [
                    "sat",
                    "sun",
                    "mon",
                    "tue",
                    "wed",
                    "thu",
                    "fri",
                  ];
                  if (value.toInt() >= 0 && value.toInt() < days.length) {
                    return Text(
                      days[value.toInt()],
                      style: const TextStyle(fontSize: 12),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 2,
                  color: Colors.cyanAccent,
                  width: 20,
                  borderRadius: BorderRadius.zero, // flat bars
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 3,
                  color: Colors.cyanAccent,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 4,
                  color: Colors.cyanAccent,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 1,
                  color: Colors.cyanAccent,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 3,
                  color: Colors.cyanAccent,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                  toY: 1,
                  color: Colors.cyanAccent,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 6,
              barRods: [
                BarChartRodData(
                  toY: 4,
                  color: Colors.cyanAccent,
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
