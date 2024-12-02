import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

import '../../../domain/entities/song/song.dart';
import '../../song_player/pages/song_player.dart';

class NewsSongsList extends StatelessWidget {
  final List<SongEntity> songs;

  const NewsSongsList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 8, right: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, i) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SongPlayerPage(song: songs[i]),
              ),
            );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(
                          fit: BoxFit.fitHeight,
                          errorWidget: (_, url, error) => Container(
                            width: 160,
                            height: double.infinity,
                            color: AppColors.darkGrey,
                            child: const Icon(
                              Icons.error,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          imageUrl:
                              '${AppUrls.coverFireStorage}${songs[i].artist} - ${songs[i].title}.jpg?${AppUrls.mediaAlt}',
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          transform: Matrix4.translationValues(10, 10, 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.isDarkMode
                                ? AppColors.darkGrey
                                : const Color(0xffe6e6e6),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: context.isDarkMode
                                ? const Color(0xff959595)
                                : const Color(0xff555555),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  songs[i].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  songs[i].artist,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, i) => const SizedBox(width: 14),
      itemCount: songs.length,
    );
  }
}
