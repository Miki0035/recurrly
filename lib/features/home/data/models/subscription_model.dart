import 'package:recurrly/features/home/domain/entities/subscription_entity.dart';

class SubscriptionModel extends SubscriptionEntity {
  SubscriptionModel({
    required super.id,
    required super.icon,
    required super.createdAt,
    required super.cardNumber,
    required super.price,
    required super.name,
    required super.frequency,
    required super.category,
    required super.planType,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json['id'],
        icon: json['icon'] ?? '',
        createdAt: DateTime.parse(json['created_at']),
        cardNumber: json['card_number'] ?? '',
        price: (json['price'] as num).toDouble(),
        name: json['name'] ?? '',
        frequency: json['frequency'],
        category: json['category'],
        planType: json['plan_type'] ?? 'Premium',
      );

  factory SubscriptionModel.fromEntity(SubscriptionEntity entity) =>
      SubscriptionModel(
        id: entity.id,
        icon: entity.icon,
        createdAt: entity.createdAt,
        cardNumber: entity.cardNumber,
        price: entity.price,
        name: entity.name,
        frequency: entity.frequency,
        category: entity.category,
        planType: '',
      );
}
