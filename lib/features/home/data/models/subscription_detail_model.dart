import 'package:recurrly/features/home/domain/entities/subscription_detail_entity.dart';

class SubscriptionDetailModel extends SubscriptionDetailEntity {
  SubscriptionDetailModel({
    required super.icon,
    required super.amount,
    required super.createdAt,
    required super.subscriptionName,
    required super.cardNumber,
    required super.planType,
  });

  factory SubscriptionDetailModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetailModel(
        icon: json['icon'],
        amount: json['amount'],
        createdAt: json['daysLeft'],
        subscriptionName: json['subscriptionName'],
        cardNumber: json['cardNumber'],
        planType: json['planType'],
      );

  factory SubscriptionDetailModel.fromEntity(SubscriptionDetailEntity entity) =>
      SubscriptionDetailModel(
        icon: entity.icon,
        amount: entity.amount,
        createdAt: entity.createdAt,
        subscriptionName: entity.subscriptionName,
        cardNumber: entity.cardNumber,
        planType: entity.planType,
      );
}
