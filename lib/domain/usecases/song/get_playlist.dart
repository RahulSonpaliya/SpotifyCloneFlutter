import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/failure.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';

import '../../../service_locator.dart';

class GetPlaylistUseCase
    implements UseCase<Either<Failure, List<SongEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<SongEntity>>> call({param}) async {
    return sl<SongRepository>().getPlaylist();
  }
}
