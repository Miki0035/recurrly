import 'package:recurrly/features/home/domain/entities/subscription_detail_entity.dart';

abstract class SubscriptionDetailRepository {
  Future<List<SubscriptionDetailEntity>> getAllSubscriptionDetails();

  Future<void> saveSubscriptionDetail(
    SubscriptionDetailEntity subscriptionDetail,
  );

  Future<void> deleteSubscriptionDetail(
    SubscriptionDetailEntity subscriptionDetail,
  );
}
