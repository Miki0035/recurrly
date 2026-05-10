import 'package:recurrly/features/home/domain/entities/subscription_entity.dart';
import 'package:recurrly/features/home/domain/repositories/subscription_repository.dart';
import 'package:recurrly/features/home/domain/usecases/params/save_subscription_params.dart';

class SaveSubscriptionUsecase {
  final SubscriptionRepository repository;
  SaveSubscriptionUsecase({required this.repository});

  Future<SubscriptionEntity> call(SaveSubscriptionParams params) async {
    if (params.name.isEmpty ||
        params.category.isEmpty ||
        params.frequency.isEmpty ||
        params.price < 0) {
      throw Exception('Please fill all the required fields');
    }
    // call repository
    return await repository.saveSubscription(params);
  }
}
