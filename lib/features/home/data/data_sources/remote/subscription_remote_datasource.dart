import 'package:flutter/foundation.dart';
import 'package:recurrly/core/services/supabase_service.dart';
import 'package:recurrly/features/home/data/models/subscription_model.dart';
import 'package:recurrly/features/home/domain/usecases/params/save_subscription_params.dart';

class SubscriptionRemoteDataSource {
  Future<List<SubscriptionModel>> getAllSubscriptions() async {
    try {
      final response = await SupabaseService.client
          .from("subscriptions")
          .select();
      return (response as List)
          .map((e) => SubscriptionModel.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint(
        "SubscriptionRemoteDatasource error getting all subscriptions: $e",
      );
      throw Exception("Error getting all subscriptions");
    }
  }

  Future<SubscriptionModel> saveSubscription(
    SaveSubscriptionParams params,
  ) async {
    try {
      final response = await SupabaseService.client
          .from('subscriptions')
          .insert({
            'card_number':
                '123-456-789-012', // TODO: change it, it should be hashed in the backend
            'price': params.price,
            'name': params.name,
            'frequency': params.frequency,
            'category': params.category,
            'owner': params.userId,
          })
          .select()
          .single();
      return SubscriptionModel.fromJson(response);
    } catch (e) {
      debugPrint('SubscriptionRemoteDataSource error saving subscription: $e');
      throw Exception('Error saving subscription');
    }
  }
}
