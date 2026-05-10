class SubscriptionEntity {
  final int id;
  final String icon;
  final String planType;
  final double price;
  final DateTime createdAt;
  final String name;
  final String cardNumber;
  final String frequency;
  final String category;

  SubscriptionEntity({
    required this.id,
    required this.icon,
    required this.price,
    required this.createdAt,
    required this.name,
    required this.cardNumber,
    required this.frequency,
    required this.category,
    required this.planType,
  });
}
