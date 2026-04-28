import 'package:flutter/material.dart';
import 'package:recurrly/utils/date_formatter.dart' show RFormatters;

class HomeSubscriptionTile extends StatelessWidget {
  final String icon;
  final Color titleBackgroundColor;
  final Color iconBackgroundColor;
  final String subscriptionName;
  final DateTime date;
  final double amount;
  final String duration;

  const HomeSubscriptionTile({
    super.key,
    required this.icon,
    required this.titleBackgroundColor,
    required this.iconBackgroundColor,
    required this.subscriptionName,
    required this.date,
    required this.amount,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: .symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: titleBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: .circular(25),
          bottomLeft: .circular(25),
        ),
      ),
      child: Row(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          // LEFT COLUMN
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    padding: .all(8),
                    decoration: BoxDecoration(
                      color: iconBackgroundColor,
                      borderRadius: .circular(12),
                    ),
                    child: Image.asset(icon, fit: .contain),
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Text(
                        subscriptionName,
                        style: TextStyle(fontWeight: .w700, fontSize: 18),
                      ),
                      Text(
                        RFormatters.formatDate(date),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Column(
            children: [
              Text(
                '\$$amount',
                style: TextStyle(fontWeight: .w700, fontSize: 18),
              ),
              Text(
                'per $duration',
                style: TextStyle(fontWeight: .w500, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
