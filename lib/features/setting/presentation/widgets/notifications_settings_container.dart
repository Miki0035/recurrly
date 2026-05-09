import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';

class NotificationSettingContainer extends StatelessWidget {
  final ValueChanged<bool> onPushNotificationToggle;
  final ValueChanged<bool> onEmailNotificationToggle;
  final ValueChanged<bool> onRenewalReminderToggle;
  final ValueChanged<bool> onPriceAlertToggle;
  final bool pushNotification;
  final bool emailNotification;
  final bool renewalReminder;
  final bool priceAlert;
  const NotificationSettingContainer({
    super.key,
    required this.onPushNotificationToggle,
    required this.onEmailNotificationToggle,
    required this.onRenewalReminderToggle,
    required this.onPriceAlertToggle,
    required this.pushNotification,
    required this.emailNotification,
    required this.renewalReminder,
    required this.priceAlert,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Notifications', style: TextStyle(fontSize: 14)),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              'Push notifcations',
              style: TextStyle(fontSize: 14, fontWeight: .w600),
            ),
            subtitle: Text('Get notified about updates'),
            trailing: Switch(
              value: pushNotification,
              onChanged: (v) => onPushNotificationToggle(v),
              padding: .zero,
            ),
          ),
          ListTile(
            title: Text(
              'Email notifications',
              style: TextStyle(fontSize: 14, fontWeight: .w600),
            ),
            subtitle: Text('Subscription updates via email'),
            trailing: Switch(
              value: emailNotification || pushNotification,
              onChanged: (v) => onEmailNotificationToggle(v),
              padding: .zero,
            ),
          ),

          Divider(color: RColors.borderColor, thickness: 1),

          ListTile(
            title: Text(
              'Renewal Reminders',
              style: TextStyle(fontSize: 14, fontWeight: .w600),
            ),
            subtitle: Text('Before subscription renews'),
            trailing: Switch(
              value: renewalReminder || pushNotification,
              onChanged: (v) => onRenewalReminderToggle(v),
            ),
          ),
          Divider(color: RColors.borderColor, thickness: 1),
          ListTile(
            title: Text(
              'Price Alerts',
              style: TextStyle(fontSize: 14, fontWeight: .w600),
            ),
            subtitle: Text('When prices change'),
            trailing: Switch(
              value: priceAlert || pushNotification,
              onChanged: (v) => onPriceAlertToggle(v),
            ),
          ),
          Divider(color: RColors.borderColor, thickness: 1),
        ],
      ),
    );
  }
}
