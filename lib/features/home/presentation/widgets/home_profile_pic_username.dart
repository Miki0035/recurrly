import 'package:flutter/material.dart';
import 'package:recurrly/core/auth/global_auth.dart';
import 'package:recurrly/core/constants/images.dart';

class HomeProfilePicUsername extends StatelessWidget {
  const HomeProfilePicUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authState,

      builder: (context, child) => Row(
        children: [
          CircleAvatar(radius: 24, backgroundImage: AssetImage(RImages.avatar)),
          SizedBox(width: 8),
          Text(
            authState.currentUser?.username ?? "",
            style: TextStyle(fontWeight: .w600, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
