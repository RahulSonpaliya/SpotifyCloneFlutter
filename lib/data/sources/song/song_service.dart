import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/base_response.dart';
import 'package:spotify_clone/data/models/song/song.dart';

import '../../../domain/entities/song/song.dart';
import '../../models/failure.dart';

abstract class SongService {
  Future<Either<Failure, List<SongEntity>>> getNewsSongs();

  Future<Either<Failure, List<SongEntity>>> getPlaylist();

  Future<Either<Failure, BaseResponse>> addOrRemoveFavSong(String songId);
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

  @override
  Future<Either<Failure, List<SongEntity>>> getPlaylist() async {
    try {
      var data = await FirebaseFirestore.instance.collection('Songs').get();
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

  @override
  Future<Either<Failure, BaseResponse>> addOrRemoveFavSong(
      String songId) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final firebaseFirestore = FirebaseFirestore.instance;
      final user = firebaseAuth.currentUser;
      final uid = user!.uid;
      var responseMessage = '';
      final favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uid)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        responseMessage = 'Favorite removed successfully';
      } else {
        await firebaseFirestore
            .collection('Users')
            .doc(uid)
            .collection('Favorites')
            .add({'songId': songId, 'addedDate': Timestamp.now()});
        responseMessage = 'Favorite added successfully';
      }
      return Right(BaseResponse(message: responseMessage));
    } catch (e) {
      return Left(Failure(0, "Some error occurred, please try again."));
    }
  }
}
