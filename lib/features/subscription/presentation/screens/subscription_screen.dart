import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/dummy_data.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/shared/home_subscription_tile.dart';

class SubscriptionScreen extends StatelessWidget {
  final int previousScreen;
  final Function(int) onNavigateBack;
  const SubscriptionScreen({
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
                'My Subscriptions',
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
              isExpandable: true,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 12),
        ),
      ],
    );
  }
}
