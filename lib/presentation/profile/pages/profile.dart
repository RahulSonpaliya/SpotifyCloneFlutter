import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/presentation/profile/widgets/favorite_songs.dart';

import '../widgets/profile_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        titleText: 'Profile',
        bgColor: context.isDarkMode ? const Color(0xff2c2b2b) : Colors.white,
        showBackButton: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileInfo(),
          SizedBox(height: 30),
          FavoriteSongs(),
        ],
      ),
    );
  }
}
