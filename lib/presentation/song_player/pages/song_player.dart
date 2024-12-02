import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/song_player/widgets/song_cover.dart';
import 'package:spotify_clone/presentation/song_player/widgets/song_detail.dart';

import '../widgets/song_player.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity song;

  const SongPlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        titleText: 'Now Playing',
        showBackButton: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SongCover(song: song),
            const SizedBox(height: 20),
            SongDetail(song: song),
            const SizedBox(height: 20),
            SongPlayer(song: song),
          ],
        ),
      ),
    );
  }
}
