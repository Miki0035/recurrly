import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';

class HomeBalanceCard extends StatelessWidget {
  final double balance;
  final String date;

  const HomeBalanceCard({super.key, required this.balance, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 132,
      padding: .symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: RColors.orange,
        borderRadius: BorderRadius.only(
          topRight: .circular(25),
          bottomLeft: .circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          Text('Balance', style: TextStyle(color: Colors.white, fontSize: 18)),
          Row(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .center,
            children: [
              Text(
                '\$$balance',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                date,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: .w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
