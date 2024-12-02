import 'package:dartz/dartz.dart';
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
}
