import 'package:flutter/material.dart';

class SubscriptionTilePaymentInfoContainer extends StatelessWidget {
  final String cardNumber;
  final VoidCallback onManage;
  const SubscriptionTilePaymentInfoContainer({
    super.key,
    required this.cardNumber,
    required this.onManage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Payment Info: ',
              style: TextStyle(fontWeight: .w500, fontSize: 12),
            ),
            SizedBox(width: 5),
            Text(
              cardNumber,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
            ),
          ],
        ),

        OutlinedButton(
          onPressed: onManage,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.black),
            minimumSize: Size(0, 0),
            padding: .symmetric(horizontal: 16, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            'Manage',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
