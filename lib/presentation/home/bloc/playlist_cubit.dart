import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/button/favorite_button/favorite_button_event.dart';
import '../../../domain/usecases/song/get_playlist.dart';
import '../../../service_locator.dart';
import 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  late StreamSubscription favButtonSubscription;

  PlaylistCubit() : super(PlaylistLoading()) {
    favButtonSubscription =
        sl<EventBus>().on<FavoriteButtonUpdatedEvent>().listen((event) {
      getPlaylist();
    });
  }

  Future<void> getPlaylist() async {
    var result = await sl<GetPlaylistUseCase>().call();
    result.fold(
      (failure) => emit(PlaylistFailure()),
      (songs) => emit(PlaylistLoaded(songs: songs)),
    );
  }

  @override
  Future<void> close() {
    favButtonSubscription.cancel();
    return super.close();
  }
}
