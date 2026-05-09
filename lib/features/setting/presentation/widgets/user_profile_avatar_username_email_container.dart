import 'package:flutter/material.dart';
import 'package:recurrly/core/auth/global_auth.dart';
import 'package:recurrly/core/constants/images.dart';

class UserProfileAvatarUsernameEmailContainer extends StatelessWidget {
  const UserProfileAvatarUsernameEmailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 30, backgroundImage: AssetImage(RImages.avatar)),
        SizedBox(width: 12),
        ListenableBuilder(
          listenable: authState,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  authState.currentUser?.username! ?? '',
                  style: TextStyle(fontWeight: .w600, fontSize: 18),
                ),
                Text(
                  authState.currentUser?.email ?? '',
                  style: TextStyle(fontWeight: .w300, fontSize: 14),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
