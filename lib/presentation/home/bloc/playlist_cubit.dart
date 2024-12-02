import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/song/get_playlist.dart';
import '../../../service_locator.dart';
import 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getPlaylist() async {
    var result = await sl<GetPlaylistUseCase>().call();
    result.fold(
      (failure) => emit(PlaylistFailure()),
      (songs) => emit(PlaylistLoaded(songs: songs)),
    );
  }
}
