import 'package:flutter/material.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';
import 'package:on_fire/featuers/dash_board/domain/entites/on_fire_entity.dart';
import 'package:fl_chart/fl_chart.dart';

Widget dailySmokeActivaty(List<RecordEntity> history) {
  return Container(
    height: 260,
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.bar_chart, color: Colors.blueAccent),
            SizedBox(width: 6),
            Text(
              "Daily Smoke Activity",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Expanded(
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              gridData: FlGridData(show: true, drawVerticalLine: false),

              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                ),

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= history.length) return const SizedBox();

                      return Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          
                          history[index].time.toString().substring(0, 3),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              barGroups: List.generate(history.length, (index) {
                final item = history[index];

                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: item.gasLevel.toDouble(),
                      width: 16,
                      borderRadius: BorderRadius.circular(4),
                      color: getColor(item.status),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    ),
  );
}

Color getColor(String status) {
  switch (status) {
    case "fire":
      return Colors.red;
    case "warning":
      return Colors.orange;
    default:
      return Colors.green;
  }
}
