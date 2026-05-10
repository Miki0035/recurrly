import 'package:recurrly/features/home/domain/entities/subscription_entity.dart';
import 'package:recurrly/features/home/domain/repositories/subscription_repository.dart';

class GetAllSubsciptionUsecase {
  final SubscriptionRepository repository;

  GetAllSubsciptionUsecase({required this.repository});

  Future<List<SubscriptionEntity>> call() async {
    return await repository.getAllSubscriptions();
  }
}
