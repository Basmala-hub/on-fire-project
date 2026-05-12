import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';
import 'package:on_fire/featuers/alerts/presentation/view/widgets/formate_time.dart';
import 'package:on_fire/featuers/dash_board/domain/entites/on_fire_entity.dart';

Widget liveTrend({required List<RecordEntity> data}) {
  final lastFive = data.length > 5 ? data.sublist(data.length - 5) : data;

  return Container(
    width: double.infinity,
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.primary,
    ),
    child: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.trending_up_outlined, color: Colors.white70),
                  SizedBox(width: 6),
                  Text(
                    "Live Trend",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Text("LAST 1H", style: TextStyle(color: Colors.white70)),
            ],
          ),

          const SizedBox(height: 15),

          // Chart
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: lastFive.isNotEmpty
                    ? (lastFive.length - 1).toDouble()
                    : 1,
                minY: 0,

                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: false),

                // Titles (axis)
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();

                        if (index < 0 || index >= lastFive.length) {
                          return const SizedBox();
                        }

                        final time = lastFive[index].time;

                        return Text(
                          formatTimeFull(time),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),

                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                // Line data
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      lastFive.length,
                      (i) =>
                          FlSpot(i.toDouble(), lastFive[i].gasLevel.toDouble()),
                    ),
                    isCurved: true,
                    barWidth: 2,
                    color: Colors.blueAccent,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
