import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/failure.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

import '../../../data/models/base_response.dart';

abstract class SongRepository {
  Future<Either<Failure, List<SongEntity>>> getNewsSongs();

  Future<Either<Failure, List<SongEntity>>> getPlaylist();

  Future<Either<Failure, BaseResponse>> addOrRemoveFavSong(String songId);

  Future<Either<Failure, BaseResponse>> isFavSong(String songId);

  Future<Either<Failure, List<SongEntity>>> getUsersFavoriteSongs();
}
