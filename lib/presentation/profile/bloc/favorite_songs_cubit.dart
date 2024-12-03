import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/get_user_favorite_songs.dart';

import '../../../common/widgets/button/favorite_button/favorite_button_event.dart';
import '../../../service_locator.dart';
import 'favorite_songs_state.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  late StreamSubscription favButtonSubscription;

  FavoriteSongsCubit() : super(FavoriteSongsLoading()) {
    favButtonSubscription = sl<EventBus>()
        .on<FavoriteButtonUpdatedEvent>()
        .listen((event) => getFavoriteSongs());
  }

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    emit(FavoriteSongsLoading());
    var result = await sl<GetUserFavoriteSongsUseCase>().call();
    result.fold(
      (failure) => emit(FavoriteSongsFailure()),
      (favoriteSongs) {
        this.favoriteSongs = favoriteSongs;
        emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeSong(SongEntity song) {
    favoriteSongs.remove(song);
    emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
  }

  @override
  Future<void> close() {
    favButtonSubscription.cancel();
    return super.close();
  }
}
