import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/base_response.dart';
import 'package:spotify_clone/data/models/failure.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';

import '../../../service_locator.dart';

class AddOrRemoveFavoriteSongUseCase
    implements UseCase<Either<Failure, BaseResponse>, String> {
  @override
  Future<Either<Failure, BaseResponse>> call({String? param}) async {
    return sl<SongRepository>().addOrRemoveFavSong(param!);
  }
}
