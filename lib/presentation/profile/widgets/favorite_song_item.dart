import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_songs_cubit.dart';

import '../../../common/widgets/button/favorite_button/favorite_button.dart';
import '../../../common/widgets/button/favorite_button/favorite_button_event.dart';
import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../service_locator.dart';
import '../../song_player/pages/song_player.dart';

class FavoriteSongItem extends StatelessWidget {
  final SongEntity song;

  const FavoriteSongItem({super.key, required this.song});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              errorWidget: (_, url, error) => Container(
                width: 60,
                height: 60,
                color: AppColors.darkGrey,
                child: const Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              width: 60,
              height: 60,
              imageUrl:
                  '${AppUrls.coverFireStorage}${song.artist} - ${song.title}.jpg?${AppUrls.mediaAlt}',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text(song.duration.toString().replaceAll('.', ':')),
                    const SizedBox(width: 15),
                    FavoriteButton(
                      song: song,
                      key: UniqueKey(),
                      onClick: () {
                        context.read<FavoriteSongsCubit>().removeSong(song);
                        sl<EventBus>().fire(FavoriteButtonUpdatedEvent());
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
