import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/icons.dart';

typedef SubscriptionTileColor = ({
  String icon,
  Color titleBackgroundColor,
  Color iconBackgroundColor,
});

final List<SubscriptionTileColor> homeSubscriptionTileColors = [
  (
    icon: RIcons.dropbox,
    titleBackgroundColor: Color(0xFFFFE5E5),
    iconBackgroundColor: Color(0xFFFF3B30),
  ),
  (
    icon: RIcons.adobe,
    titleBackgroundColor: RColors.lightGreen,
    iconBackgroundColor: Color(0xFF1DB954),
  ),
  (
    icon: RIcons.canva,
    titleBackgroundColor: Color(0xFFFFF4E5),
    iconBackgroundColor: Color(0xFFFF2D20),
  ),
  (
    icon: RIcons.figma,
    titleBackgroundColor: Color(0xFFEAF2FF),
    iconBackgroundColor: Color(0xFF4A90E2),
  ),
  (
    icon: RIcons.github,
    titleBackgroundColor: Color(0xFFF8F9FA),
    iconBackgroundColor: Color(0xFFF2F2F2),
  ),
  (
    icon: RIcons.medium,
    titleBackgroundColor: Color(0xFFE6F7FF),
    iconBackgroundColor: Color(0xFF00C4CC),
  ),
  (
    icon: RIcons.openai,
    titleBackgroundColor: Color(0xFFFFEFE6),
    iconBackgroundColor: Color(0xFFF24E1E),
  ),
  (
    icon: RIcons.notion,
    titleBackgroundColor: Color(0xFFE6F7FF),
    iconBackgroundColor: Color(0xFF00C4CC),
  ),
  (
    icon: RIcons.spotify,
    titleBackgroundColor: Color(0xFFF8F9FA),
    iconBackgroundColor: Color(0xFFEFEFEF),
  ),
  (
    icon: RIcons.netflix,
    titleBackgroundColor: Color(0xFFE6F0FF),
    iconBackgroundColor: Color(0xFF0061FF),
  ),
  (
    icon: RIcons.claude,
    titleBackgroundColor: Color(0xFFEDE7FF),
    iconBackgroundColor: Color(0xFF6C5CE7),
  ),
];
