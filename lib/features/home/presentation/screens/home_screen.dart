import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/dummy_data.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/features/home/presentation/widgets/home_balance_card.dart';
import 'package:recurrly/features/home/presentation/widgets/home_profile_pic_username.dart';
import 'package:recurrly/features/home/presentation/widgets/home_subscription_detail_card.dart';
import 'package:recurrly/shared/home_subscription_tile.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onNavigateToSubscription;
  const HomeScreen({super.key, required this.onNavigateToSubscription});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            HomeProfilePicUsername(),

            GestureDetector(
              onTap: () {},
              child: Container(
                width: 42,
                padding: .all(8),
                decoration: BoxDecoration(
                  borderRadius: .circular(50),
                  border: .all(color: RColors.borderColor),
                ),

                child: Image.asset(RIcons.add, fit: .contain),
              ),
            ),
          ],
        ),

        SizedBox(height: 18),
        // BALANCE CONTAINER
        HomeBalanceCard(balance: 198.53, date: '04/21'),

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

        SizedBox(height: 18),

        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: subscriptions.length,
            scrollDirection: .horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 12),

            itemBuilder: (context, index) {
              final subscription = subscriptions[index];
              return HomeSubscriptionDetailCard(
                icon: subscription.icon,
                amount: subscription.amount,
                createdAt: subscription.createdAt,
                subscriptionName: subscription.subscriptionName,
              );
            },
          ),
        ),

        SizedBox(height: 18),

        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'All Subscriptions',
              style: TextStyle(fontWeight: .w700, fontSize: 18),
            ),

            TextButton(
              onPressed: onNavigateToSubscription,
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
}
