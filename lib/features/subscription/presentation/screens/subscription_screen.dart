import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/dummy_data.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/features/home/data/data_sources/local/subscription_local_datasource.dart';
import 'package:recurrly/features/home/data/data_sources/remote/subscription_remote_datasource.dart';
import 'package:recurrly/features/home/data/repositories/subscription_repository_impl.dart';
import 'package:recurrly/features/home/domain/usecases/get_all_subsciption_usecase.dart';
import 'package:recurrly/features/home/domain/usecases/save_subscription_usecase.dart';
import 'package:recurrly/features/home/presentation/controllers/subscription_controller.dart';
import 'package:recurrly/shared/ui/home_subscription_tile.dart';

class SubscriptionScreen extends StatelessWidget {
  final int previousScreen;
  final Function(int) onNavigateBack;
  SubscriptionScreen({
    super.key,
    required this.previousScreen,
    required this.onNavigateBack,
  });

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
                final subscription = subscriptions[index];
                final tile = homeSubscriptionTileColors[index];
                return HomeSubscriptionTile(
                  subscription: subscription,
                  titleBackgroundColor: tile.titleBackgroundColor,
                  iconBackgroundColor: tile.iconBackgroundColor,
                  onManage: () {},
                  onChange: () {},
                  isExpandable: true,
                  icon: tile.icon,
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
