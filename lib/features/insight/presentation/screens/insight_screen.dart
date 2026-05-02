import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/dummy_data.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/shared/home_subscription_tile.dart';

class InsightScreen extends StatefulWidget {
  final int previousScreen;
  final Function(int) onNavigateBack;
  const InsightScreen({
    super.key,
    required this.previousScreen,
    required this.onNavigateBack,
  });

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  int? touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: .center,
          children: [
            GestureDetector(
              onTap: () => widget.onNavigateBack(widget.previousScreen),
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
          aspectRatio: 4 / 3,
          child: Container(
            decoration: BoxDecoration(
              color: RColors.darkerBeige,
              borderRadius: .circular(15),
            ),
            padding: .only(left: 8, right: 8, top: 14),
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  enabled: true,

                  touchTooltipData: BarTouchTooltipData(
                    tooltipBorderRadius: .circular(10),
                    getTooltipColor: (_) => Colors.white,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      if (groupIndex != touchedIndex) {
                        return null;
                      }
                      return BarTooltipItem(
                        "\$${rod.toY.toInt().toString()}",
                        TextStyle(color: RColors.orange, fontWeight: .w600),
                      );
                    },
                  ),
                  touchCallback: (event, barTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          barTouchResponse == null ||
                          barTouchResponse.spot == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          barTouchResponse.spot!.touchedBarGroupIndex;
                    });
                  },
                ),

                titlesData: FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 40,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = [
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat",
                          "Sun",
                        ];

                        return SideTitleWidget(
                          meta: meta,
                          space: 7,
                          child: Text(days[value.toInt()]),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      maxIncluded: false,
                      interval: 5,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta,
                          space: 2,
                          child: Text(value.toInt().toString()),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  horizontalInterval: 5,
                  drawVerticalLine: false,
                ),

                barGroups: [35, 30, 20, 40, 35, 23, 25]
                    .asMap()
                    .entries
                    .map(
                      (entry) =>
                          makeGroupData(entry.key, entry.value.toDouble()),
                    )
                    .toList(),
              ),
              curve: Curves.linear,
            ),
          ),
        ),

        SizedBox(height: 12),
        Padding(
          padding: .all(8),
          child: Container(
            padding: .symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: .circular(15),
              border: Border.all(color: RColors.borderColor),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Expenses',
                      style: TextStyle(fontWeight: .w700, fontSize: 18),
                    ),

                    SizedBox(height: 12),

                    Text('March 2026', style: TextStyle(fontSize: 14)),
                  ],
                ),

                Column(
                  crossAxisAlignment: .end,
                  children: [
                    Text(
                      '-\$424.63',
                      style: TextStyle(fontWeight: .w700, fontSize: 18),
                    ),

                    SizedBox(height: 12),

                    Text('+12%', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 18),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('History', style: TextStyle(fontWeight: .w700, fontSize: 18)),

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

        SizedBox(height: 18),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeSubscriptions.length,
          itemBuilder: (context, index) {
            final tile = homeSubscriptions[index];
            return HomeSubscriptionTile(
              subscription: tile.subscription,
              titleBackgroundColor: tile.titleBackgroundColor,
              iconBackgroundColor: tile.iconBackgroundColor,
              onManage: () {},
              onChange: () {},
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 12),
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
          color: y >= 40 ? RColors.orange : Colors.black,
          width: width,
          borderSide: BorderSide(color: Colors.white, width: 0),
        ),
      ],
    );
  }
}
