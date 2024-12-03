import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/button/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_favorite_song.dart';

import '../../../../service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
      param: songId,
    );
    result.fold(
      (failure) => {},
      (response) {
        emit(FavoriteButtonUpdated());
      },
    );
  }
}
