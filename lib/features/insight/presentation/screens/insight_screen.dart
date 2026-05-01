import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/icons.dart';

class InsightScreen extends StatelessWidget {
  final int previousScreen;
  final Function(int) onNavigateBack;
  const InsightScreen({
    super.key,
    required this.previousScreen,
    required this.onNavigateBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: .center,
          children: [
            GestureDetector(
              onTap: () => onNavigateBack(previousScreen),
              child: Container(
                width: 42,
                padding: .all(8),
                decoration: BoxDecoration(
                  borderRadius: .circular(50),
                  border: .all(color: RColors.borderColor),
                ),

                child: Image.asset(RIcons.back, fit: .contain),
              ),
            ),

            Expanded(
              child: Text(
                'Monthly Insights',
                textAlign: .center,
                style: TextStyle(fontSize: 18, fontWeight: .w700),
              ),
            ),

            GestureDetector(
              onTap: () {},
              child: Container(
                width: 42,
                padding: .all(8),
                decoration: BoxDecoration(
                  borderRadius: .circular(50),
                  border: .all(color: RColors.borderColor),
                ),

                child: Image.asset(RIcons.menu, fit: .contain),
              ),
            ),
          ],
        ),

        SizedBox(height: 18),

        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('Upcoming', style: TextStyle(fontWeight: .w700, fontSize: 18)),

            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                side: BorderSide(color: RColors.borderColor),
              ),
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w700,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 24),

        // BAR CHART
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Padding(
            padding: .symmetric(horizontal: 8),
            child: BarChart(
              BarChartData(
                backgroundColor: RColors.darkerBeige,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        String text = switch (value.toInt()) {
                          0 => "Mon",
                          1 => "Tue",
                          2 => "Wed",
                          3 => "Thu",
                          4 => "Fri",
                          5 => "Sat",
                          6 => "Sun",
                          _ => '',
                        };
                        return SideTitleWidget(
                          meta: meta,
                          space: 0,
                          child: Text(text),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 5,
                      getTitlesWidget: (value, meta) {
                        String text;
                        if (value <= 0) {
                          text = "0";
                        } else if (value <= 5) {
                          text = "5";
                        } else if (value <= 25) {
                          text = "25";
                        } else if (value <= 35) {
                          text = "35";
                        } else {
                          text = "45";
                        }

                        return SideTitleWidget(
                          meta: meta,
                          space: 2,
                          child: Text(text),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  horizontalInterval: 2,
                  drawVerticalLine: false,
                ),
                barGroups: List.generate(
                  7,
                  (i) => makeGroupData(i, Random().nextInt(15).toDouble()),
                ),
              ),
              curve: Curves.linear,
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(int x, double y, {double width = 14}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: x > 5 ? RColors.orange : Colors.black,
          width: width,
          borderSide: BorderSide(color: Colors.white, width: 0),
        ),
      ],
    );
  }
}
