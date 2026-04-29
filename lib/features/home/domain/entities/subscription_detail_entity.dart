class SubscriptionDetailEntity {
  final String icon;
  final double amount;
  final DateTime createdAt;
  final String subscriptionName;
  final String cardNumber;
  final String planType;

  SubscriptionDetailEntity({
    required this.icon,
    required this.amount,
    required this.createdAt,
    required this.subscriptionName,
    required this.cardNumber,
    required this.planType,
  });
}
