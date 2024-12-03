import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/button/favorite_button/favorite_button_cubit.dart';
import 'package:spotify_clone/common/widgets/button/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity song;
  final Function? onClick;

  const FavoriteButton({
    super.key,
    required this.song,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (_, state) {
          if (state is FavoriteButtonUpdated) {
            song.isFavorite = !song.isFavorite;
          }
          return IconButton(
            onPressed: () async {
              await _
                  .read<FavoriteButtonCubit>()
                  .favoriteButtonUpdated(song.songId);
              if (onClick != null) {
                onClick!();
              }
            },
            icon: Icon(
              song.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: AppColors.darkGrey,
            ),
          );
        },
      ),
    );
  }
}
