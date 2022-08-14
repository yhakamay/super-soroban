import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_circle),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => Scaffold(
              appBar: AppBar(),
              body: const ProfileScreen(
                avatarSize: 96.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
