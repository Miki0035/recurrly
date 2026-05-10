class SaveSubscriptionParams {
  final String name;
  final String category;
  final String frequency;
  final double price;
  final String userId;

  SaveSubscriptionParams({
    required this.name,
    required this.category,
    required this.frequency,
    required this.price,
    required this.userId,
  });
}
