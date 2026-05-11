import 'package:recurrly/features/home/data/data_sources/local/subscription_local_datasource.dart';
import 'package:recurrly/features/home/domain/entities/subscription_entity.dart';
import 'package:recurrly/features/home/data/data_sources/remote/subscription_remote_datasource.dart';
import 'package:recurrly/features/home/domain/repositories/subscription_repository.dart';
import 'package:recurrly/features/home/domain/usecases/params/save_subscription_params.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionRemoteDataSource datasource;
  final SubscriptionLocalDatasource localDatasource;

  SubscriptionRepositoryImpl({
    required this.datasource,
    required this.localDatasource,
  });

  @override
  Future<List<SubscriptionEntity>> getAllSubscriptions() async {
    return datasource.getAllSubscriptions();
  }

  @override
  Future<SubscriptionEntity> saveSubscription(
    SaveSubscriptionParams params,
  ) async {
    // call remote datasource
    final model = await datasource.saveSubscription(params);
    return model;
  }
}
