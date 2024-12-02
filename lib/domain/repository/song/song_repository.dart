import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/failure.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class SongRepository {
  Future<Either<Failure, List<SongEntity>>> getNewsSongs();
}
