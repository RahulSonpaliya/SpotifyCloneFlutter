import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/song/song.dart';

class SongDetail extends StatelessWidget {
  final SongEntity song;

  const SongDetail({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              song.artist,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_outlined,
            size: 32,
            color: AppColors.darkGrey,
          ),
        )
      ],
    );
  }
}
