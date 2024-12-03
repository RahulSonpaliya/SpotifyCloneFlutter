import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_songs_cubit.dart';

import 'favorite_songs_list.dart';

class FavoriteSongs extends StatelessWidget {
  const FavoriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FAVORITE SONGS'),
            SizedBox(height: 10),
            FavoriteSongsList(),
          ],
        ),
      ),
    );
  }
}
