import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/song/song.dart';

class SongCover extends StatelessWidget {
  final SongEntity song;

  const SongCover({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: CachedNetworkImage(
          fit: BoxFit.fitHeight,
          errorWidget: (_, url, error) => Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.darkGrey,
            child: const Icon(
              Icons.error,
              color: Colors.white,
              size: 20,
            ),
          ),
          imageUrl:
              '${AppUrls.coverFireStorage}${song.artist} - ${song.title}.jpg?${AppUrls.mediaAlt}',
        ),
      ),
    );
  }
}
