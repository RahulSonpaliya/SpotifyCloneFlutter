import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_state.dart';

import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var result = await sl<GetNewsSongsUseCase>().call();
    result.fold(
      (failure) => emit(NewsSongsFailure()),
      (songs) => emit(NewsSongsLoaded(songs: songs)),
    );
  }
}
