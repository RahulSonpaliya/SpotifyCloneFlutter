import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/song/song.dart';

class SongPlayer extends StatelessWidget {
  final SongEntity song;

  const SongPlayer({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(value: 0.0, onChanged: (val) {}),
        const SizedBox(
          height: 5,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('2:25'),
            Text('4:02'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: const Icon(Icons.play_arrow),
        )
      ],
    );
  }
}
