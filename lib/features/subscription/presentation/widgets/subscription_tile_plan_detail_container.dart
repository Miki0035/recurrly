import 'package:flutter/material.dart';

class SubscriptionTilePlanDetailContainer extends StatelessWidget {
  final String planType;
  final VoidCallback onChange;
  const SubscriptionTilePlanDetailContainer({
    super.key,
    required this.planType,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Plan details: ',
              style: TextStyle(fontWeight: .w500, fontSize: 12),
            ),
            SizedBox(width: 5),
            Text(
              planType,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
            ),
          ],
        ),

        OutlinedButton(
          onPressed: onChange,
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
            'Change',
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
