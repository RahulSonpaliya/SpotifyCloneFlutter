import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/button/favorite_button/favorite_button.dart';

import '../../../common/widgets/button/favorite_button/favorite_button_event.dart';
import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';

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
        FavoriteButton(
          song: song,
          onClick: () => sl<EventBus>().fire(
            FavoriteButtonUpdatedEvent(),
          ),
        ),
      ],
    );
  }
}
