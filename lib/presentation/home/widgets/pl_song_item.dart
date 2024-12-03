import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/song_player/pages/song_player.dart';

import '../../../common/widgets/button/favorite_button/favorite_button.dart';
import '../../../core/configs/theme/app_colors.dart';

class PLSongItem extends StatelessWidget {
  final SongEntity song;

  const PLSongItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SongPlayerPage(song: song),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? AppColors.darkGrey
                      : const Color(0xffe6e6e6),
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.isDarkMode
                      ? const Color(0xff959595)
                      : const Color(0xff555555),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    song.artist,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(song.duration.toString().replaceAll('.', ':')),
              const SizedBox(width: 15),
              FavoriteButton(song: song),
            ],
          )
        ],
      ),
    );
  }
}
