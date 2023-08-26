import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/fade_profile_text.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/profile_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/show_dialog.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user?.photoURL ??
                          "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user?.displayName ?? 'Not Found',
                            style: Styles.textStyle16),
                        Text(
                          user?.email ?? '',
                          style: Styles.textStyle14.copyWith(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const FadeProfileText(
                text: "General",
              ),
              const ProfileText(
                text: "Edit Profile",
              ),
              const ProfileText(text: "Notifications"),
              const ProfileText(text: "Wishlist"),
              const FadeProfileText(
                text: "Legal",
              ),
              const ProfileText(text: "Terms of Use"),
              const ProfileText(text: "Privacy Policy"),
              const FadeProfileText(
                text: "Personal",
              ),
              const ProfileText(
                text: "Report a Bug",
              ),
              ProfileText(
                onTap: () {
                  showMyDialog(context);
                },
                text: "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
