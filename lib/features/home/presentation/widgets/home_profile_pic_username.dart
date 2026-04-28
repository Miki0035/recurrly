import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/images.dart';

class HomeProfilePicUsername extends StatelessWidget {
  const HomeProfilePicUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 24, backgroundImage: AssetImage(RImages.avatar)),
        SizedBox(width: 8),
        Text('Miki0035', style: TextStyle(fontWeight: .w600, fontSize: 22)),
      ],
    );
  }
}
