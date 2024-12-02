import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/presentation/profile/pages/profile.dart';

import '../widgets/home_artist_card.dart';
import '../widgets/home_tabs.dart';
import '../widgets/news_songs.dart';
import '../widgets/playlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        showLogo: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeArtistCard(),
            HomeTabs(
              controller: _tabController,
            ),
            SizedBox(
              height: 220,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NewsSongs(),
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Playlist(),
          ],
        ),
      ),
    );
  }
}
