import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/song/song.dart';

import '../../../domain/entities/song/song.dart';
import '../../models/failure.dart';

abstract class SongService {
  Future<Either<Failure, List<SongEntity>>> getNewsSongs();
}

class SongFirebaseService extends SongService {
  @override
  Future<Either<Failure, List<SongEntity>>> getNewsSongs() async {
    try {
      var data =
          await FirebaseFirestore.instance.collection('Songs').limit(3).get();
      List<SongEntity> songs = [];
      for (var e in data.docs) {
        var songModel = SongModel.fromJson(e.data());
        songModel.songId = e.reference.id;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return Left(Failure(0, "Some error occurred, please try again."));
    }
  }
}
