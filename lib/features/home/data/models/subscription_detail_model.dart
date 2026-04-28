import 'package:recurrly/features/home/domain/entities/subscription_detail_entity.dart';

class SubscriptionDetailModel extends SubscriptionDetailEntity {
  SubscriptionDetailModel({
    required super.icon,
    required super.amount,
    required super.daysLeft,
    required super.subscriptionName,
  });

  factory SubscriptionDetailModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetailModel(
        icon: json['icon'],
        amount: json['amount'],
        daysLeft: json['daysLeft'],
        subscriptionName: json['subscriptionName'],
      );

  factory SubscriptionDetailModel.fromEntity(SubscriptionDetailEntity entity) =>
      SubscriptionDetailModel(
        icon: entity.icon,
        amount: entity.amount,
        daysLeft: entity.daysLeft,
        subscriptionName: entity.subscriptionName,
      );
}
