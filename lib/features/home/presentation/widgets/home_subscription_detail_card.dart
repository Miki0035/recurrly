import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/utils/date_formatter.dart';

class HomeSubscriptionDetailCard extends StatelessWidget {
  final String icon;
  final double amount;
  final DateTime createdAt;
  final String subscriptionName;

  const HomeSubscriptionDetailCard({
    super.key,
    required this.icon,
    required this.amount,
    required this.createdAt,
    required this.subscriptionName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .only(left: 12, right: 18, top: 16, bottom: 16),
      decoration: BoxDecoration(
        border: .all(color: RColors.borderColor),
        borderRadius: .circular(20),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                padding: .all(8),
                decoration: BoxDecoration(
                  color: RColors.darkerBeige,
                  borderRadius: .circular(12),
                ),
                child: Image.asset(icon, fit: .contain),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    '\$${amount.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: .w700, fontSize: 18),
                  ),
                  Text(
                    RDateFormatters.formatDaysLeft(createdAt),
                    style: TextStyle(fontSize: 12, fontWeight: .w300),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            subscriptionName,
            style: TextStyle(fontWeight: .w800, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
