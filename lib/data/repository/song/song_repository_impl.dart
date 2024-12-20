import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/base_response.dart';
import 'package:spotify_clone/data/models/failure.dart';
import 'package:spotify_clone/data/sources/song/song_service.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either<Failure, List<SongEntity>>> getNewsSongs() async {
    return sl<SongService>().getNewsSongs();
  }

  @override
  Future<Either<Failure, List<SongEntity>>> getPlaylist() async {
    return sl<SongService>().getPlaylist();
  }

  @override
  Future<Either<Failure, BaseResponse>> addOrRemoveFavSong(
      String songId) async {
    return sl<SongService>().addOrRemoveFavSong(songId);
  }

  @override
  Future<Either<Failure, List<SongEntity>>> getUsersFavoriteSongs() async {
    return sl<SongService>().getUsersFavoriteSongs();
  }

  @override
  Future<Either<Failure, BaseResponse>> isFavSong(String songId) async {
    return sl<SongService>().isFavSong(songId);
  }
}
