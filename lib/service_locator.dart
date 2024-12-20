import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_service.dart';
import 'package:spotify_clone/data/sources/song/song_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_favorite_song.dart';

import 'domain/usecases/auth/get_user.dart';
import 'domain/usecases/auth/is_user_logged_in.dart';
import 'domain/usecases/auth/signin.dart';
import 'domain/usecases/auth/signout.dart';
import 'domain/usecases/auth/signup.dart';
import 'domain/usecases/auth/upload_profile_image.dart';
import 'domain/usecases/song/get_news_songs.dart';
import 'domain/usecases/song/get_playlist.dart';
import 'domain/usecases/song/get_user_favorite_songs.dart';
import 'domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthService>(AuthFirebaseService());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SongService>(SongFirebaseService());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetUserFavoriteSongsUseCase>(
      GetUserFavoriteSongsUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
  sl.registerSingleton<EventBus>(EventBus());
  sl.registerSingleton<IsUserLoggedInUseCase>(IsUserLoggedInUseCase());
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase());
  sl.registerSingleton<UploadProfileImageUseCase>(UploadProfileImageUseCase());
}
