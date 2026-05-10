import 'package:recurrly/core/common/auth_result.dart';
import 'package:recurrly/features/home/domain/entities/subscription_entity.dart';
import 'package:recurrly/features/home/domain/usecases/get_all_subsciption_usecase.dart';
import 'package:recurrly/features/home/domain/usecases/params/save_subscription_params.dart';
import 'package:recurrly/features/home/domain/usecases/save_subscription_usecase.dart';

class SubscriptionController {
  final SaveSubscriptionUsecase saveSubscriptionUsecase;
  final GetAllSubsciptionUsecase getAllSubsciptionUsecase;

  SubscriptionController({
    required this.saveSubscriptionUsecase,
    required this.getAllSubsciptionUsecase,
  });

  Future<AuthResult<SubscriptionEntity>> saveSubscription({
    required String name,
    required String category,
    required String frequency,
    required double price,
    required String userId,
  }) async {
    try {
      // create params
      final params = SaveSubscriptionParams(
        name: name,
        category: category,
        frequency: frequency,
        price: price,
        userId: userId,
      );
      // send to usecase
      final subscription = await saveSubscriptionUsecase.call(params);
      return AuthResult.success(subscription);
    } catch (e) {
      return AuthResult.failure(e.toString());
    }
  }

  Future<AuthResult<List<SubscriptionEntity>>> getAllSubscriptions() async {
    try {
      final subscriptions = await getAllSubsciptionUsecase.call();
      return AuthResult.success(subscriptions);
    } catch (e) {
      return AuthResult.failure(e.toString());
    }
  }
}
