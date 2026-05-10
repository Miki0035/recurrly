import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/dummy_data.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/features/home/data/data_sources/local/subscription_local_datasource.dart';
import 'package:recurrly/features/home/data/data_sources/remote/subscription_remote_datasource.dart';
import 'package:recurrly/features/home/data/repositories/subscription_repository_impl.dart';
import 'package:recurrly/features/home/domain/entities/subscription_entity.dart';
import 'package:recurrly/features/home/domain/usecases/get_all_subsciption_usecase.dart';
import 'package:recurrly/features/home/domain/usecases/save_subscription_usecase.dart';
import 'package:recurrly/features/home/presentation/controllers/subscription_controller.dart';
import 'package:recurrly/features/home/presentation/widgets/form/create_subscription_form.dart';
import 'package:recurrly/features/home/presentation/widgets/home_balance_card.dart';
import 'package:recurrly/features/home/presentation/widgets/home_profile_pic_username.dart';
import 'package:recurrly/features/home/presentation/widgets/home_subscription_detail_card.dart';
import 'package:recurrly/shared/home_subscription_tile.dart';

typedef SubscriptionInfo = ({
  SubscriptionEntity subscription,
  Color titleBackgroundColor,
  Color iconBackgroundColor,
});

class HomeScreen extends StatelessWidget {
  final VoidCallback onNavigateToSubscription;
  HomeScreen({super.key, required this.onNavigateToSubscription});

  final controller = SubscriptionController(
    saveSubscriptionUsecase: SaveSubscriptionUsecase(
      repository: SubscriptionRepositoryImpl(
        datasource: SubscriptionRemoteDataSource(),
        localDatasource: SubscriptionLocalDatasource(),
      ),
    ),
    getAllSubsciptionUsecase: GetAllSubsciptionUsecase(
      repository: SubscriptionRepositoryImpl(
        datasource: SubscriptionRemoteDataSource(),
        localDatasource: SubscriptionLocalDatasource(),
      ),
    ),
  );

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
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => CreateSubscriptionFormContainer(),
                );
              },
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
          child: FutureBuilder(
            future: controller.getAllSubscriptions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == .waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('No subscriptions found');
              }
              final subscriptions = snapshot.data!.data!;

              return ListView.separated(
                itemCount: subscriptions.length,
                scrollDirection: .horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 12),

                itemBuilder: (context, index) {
                  final subscription = subscriptions[index];
                  return HomeSubscriptionDetailCard(
                    icon: subscription.icon,
                    amount: subscription.price,
                    createdAt: subscription.createdAt,
                    subscriptionName: subscription.name,
                  );
                },
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

        FutureBuilder(
          future: controller.getAllSubscriptions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == .waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('No subscriptions found');
            }
            final subscriptions = snapshot.data!.data!;
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subscriptions.length,
              itemBuilder: (context, index) {
                final tile = homeSubscriptionTileColors[index];
                return HomeSubscriptionTile(
                  subscription: subscriptions[index],
                  titleBackgroundColor: tile.titleBackgroundColor,
                  iconBackgroundColor: tile.iconBackgroundColor,
                  onManage: () {},
                  onChange: () {},
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
            );
          },
        ),
      ],
    );
  }
}
