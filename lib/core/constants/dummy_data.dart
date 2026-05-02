import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/features/home/data/models/subscription_detail_model.dart';

typedef SubscriptionInfo = ({
  SubscriptionDetailModel subscription,
  Color titleBackgroundColor,
  Color iconBackgroundColor,
});

final List<SubscriptionDetailModel> subscriptions = [
  SubscriptionDetailModel(
    icon: RIcons.netflix,
    amount: 15.99,
    createdAt: DateTime(2025, 5, 12, 10, 30),
    subscriptionName: 'Netflix',
    cardNumber: '**** **** **** 1234',
    planType: 'Premium',
  ),
  SubscriptionDetailModel(
    icon: RIcons.spotify,
    amount: 9.99,
    createdAt: DateTime(2025, 5, 20, 9, 0),
    subscriptionName: 'Spotify',
    cardNumber: '**** **** **** 5678',
    planType: 'Trial',
  ),
  SubscriptionDetailModel(
    icon: RIcons.adobe,
    amount: 29.99,
    createdAt: DateTime(2025, 5, 5, 14, 15),
    subscriptionName: 'Adobe',
    cardNumber: '**** **** **** 9012',
    planType: 'Freemium',
  ),
  SubscriptionDetailModel(
    icon: RIcons.openai,
    amount: 20.00,
    createdAt: DateTime(2025, 5, 18, 11, 45),
    subscriptionName: 'OpenAI',
    cardNumber: '**** **** **** 3456',
    planType: 'Premium',
  ),
  SubscriptionDetailModel(
    icon: RIcons.notion,
    amount: 8.00,
    createdAt: DateTime(2025, 5, 25, 8, 30),
    subscriptionName: 'Notion',
    cardNumber: '**** **** **** 7890',
    planType: 'Trail',
  ),
  SubscriptionDetailModel(
    icon: RIcons.github,
    amount: 4.00,
    createdAt: DateTime(2025, 5, 10, 16, 0),
    subscriptionName: 'GitHub',
    cardNumber: '**** **** **** 2345',
    planType: 'Premium',
  ),
  SubscriptionDetailModel(
    icon: RIcons.canva,
    amount: 12.99,
    createdAt: DateTime(2025, 5, 14, 13, 20),
    subscriptionName: 'Canva',
    cardNumber: '**** **** **** 5678',
    planType: 'Freemium',
  ),
  SubscriptionDetailModel(
    icon: RIcons.figma,
    amount: 15.00,
    createdAt: DateTime(2025, 5, 22, 10, 10),
    subscriptionName: 'Figma',
    cardNumber: '**** **** **** 1234',
    planType: 'Freemium',
  ),
  SubscriptionDetailModel(
    icon: RIcons.dropbox,
    amount: 11.99,
    createdAt: DateTime(2025, 5, 28, 15, 0),
    subscriptionName: 'Dropbox',
    cardNumber: '**** **** **** 8765',
    planType: 'Trial',
  ),
  SubscriptionDetailModel(
    icon: RIcons.medium,
    amount: 5.00,
    createdAt: DateTime(2025, 5, 28, 7, 50),
    subscriptionName: 'Medium',
    cardNumber: '**** **** **** 9876',
    planType: 'Trial',
  ),
  SubscriptionDetailModel(
    icon: RIcons.claude,
    amount: 18.00,
    createdAt: DateTime(2025, 5, 16, 12, 0),
    subscriptionName: 'Claude',
    cardNumber: '**** **** **** 6789',
    planType: 'Premium',
  ),
];

final List<SubscriptionInfo> homeSubscriptions = [
  (
    subscription: subscriptions[0],
    titleBackgroundColor: Color(0xFFFFE5E5),
    iconBackgroundColor: Color(0xFFFF3B30),
  ),
  (
    subscription: subscriptions[1],
    titleBackgroundColor: RColors.lightGreen,
    iconBackgroundColor: Color(0xFF1DB954),
  ),
  (
    subscription: subscriptions[2],
    titleBackgroundColor: Color(0xFFFFF4E5),
    iconBackgroundColor: Color(0xFFFF2D20),
  ),
  (
    subscription: subscriptions[3],
    titleBackgroundColor: Color(0xFFEAF2FF),
    iconBackgroundColor: Color(0xFF4A90E2),
  ),
  (
    subscription: subscriptions[4],
    titleBackgroundColor: Color(0xFFF8F9FA),
    iconBackgroundColor: Color(0xFFF2F2F2),
  ),
  (
    subscription: subscriptions[5],
    titleBackgroundColor: Color(0xFFE6F7FF),
    iconBackgroundColor: Color(0xFF00C4CC),
  ),
  (
    subscription: subscriptions[6],
    titleBackgroundColor: Color(0xFFFFEFE6),
    iconBackgroundColor: Color(0xFFF24E1E),
  ),
  (
    subscription: subscriptions[7],
    titleBackgroundColor: Color(0xFFE6F7FF),
    iconBackgroundColor: Color(0xFF00C4CC),
  ),
  (
    subscription: subscriptions[8],
    titleBackgroundColor: Color(0xFFE6F0FF),
    iconBackgroundColor: Color(0xFF0061FF),
  ),
  (
    subscription: subscriptions[9],
    titleBackgroundColor: Color(0xFFF8F9FA),
    iconBackgroundColor: Color(0xFFEFEFEF),
  ),
  (
    subscription: subscriptions[10],
    titleBackgroundColor: Color(0xFFEDE7FF),
    iconBackgroundColor: Color(0xFF6C5CE7),
  ),
];
