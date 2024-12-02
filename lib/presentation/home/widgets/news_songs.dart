import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_clone/presentation/home/widgets/news_songs_list.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
        builder: (_, state) {
          if (state is NewsSongsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsSongsLoaded) {
            return NewsSongsList(songs: state.songs);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
