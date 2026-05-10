import 'package:recurrly/features/home/domain/entities/subscription_entity.dart';
import 'package:recurrly/features/home/domain/usecases/params/save_subscription_params.dart';

abstract class SubscriptionRepository {
  Future<List<SubscriptionEntity>> getAllSubscriptions();

  Future<SubscriptionEntity> saveSubscription(SaveSubscriptionParams params);
}
