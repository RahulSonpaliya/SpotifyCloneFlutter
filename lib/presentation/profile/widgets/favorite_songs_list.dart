import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_songs_cubit.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_songs_state.dart';

import 'favorite_song_item.dart';

class FavoriteSongsList extends StatelessWidget {
  const FavoriteSongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
      builder: (_, state) {
        if (state is FavoriteSongsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is FavoriteSongsLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, i) => FavoriteSongItem(
              song: state.favoriteSongs[i],
            ),
            separatorBuilder: (_, i) => const SizedBox(height: 20),
            itemCount: state.favoriteSongs.length,
          );
        }
        if (state is FavoriteSongsFailure) {
          return const Center(child: Text('Please try again.'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
