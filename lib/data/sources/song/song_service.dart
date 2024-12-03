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

  Future<Either<Failure, BaseResponse>> isFavSong(String songId);

  Future<Either<Failure, List<SongEntity>>> getUsersFavoriteSongs();
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
        final isFavResult = await isFavSong(e.reference.id);
        isFavResult.fold(
          (l) => {},
          (response) => songModel.isFavorite = response.success,
        );
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
        final isFavResult = await isFavSong(e.reference.id);
        isFavResult.fold(
          (l) => {},
          (response) => songModel.isFavorite = response.success,
        );
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

  @override
  Future<Either<Failure, BaseResponse>> isFavSong(String songId) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final firebaseFirestore = FirebaseFirestore.instance;
      final favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(firebaseAuth.currentUser?.uid)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();
      return Right(BaseResponse(success: favoriteSongs.docs.isNotEmpty));
    } catch (e) {
      return Left(Failure(0, "Some error occurred, please try again."));
    }
  }

  @override
  Future<Either<Failure, List<SongEntity>>> getUsersFavoriteSongs() async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final firebaseFirestore = FirebaseFirestore.instance;
      final uid = firebaseAuth.currentUser?.uid;
      final favoriteSnapshot = await firebaseFirestore
          .collection('Users')
          .doc(uid)
          .collection('Favorites')
          .get();
      final List<SongEntity> favoriteSongs = [];
      for (var e in favoriteSnapshot.docs) {
        var songId = e['songId'];
        var song =
            await firebaseFirestore.collection('Songs').doc(songId).get();
        var songModel = SongModel.fromJson(song.data()!);
        songModel.isFavorite = true;
        songModel.songId = songId;
        favoriteSongs.add(songModel.toEntity());
      }
      return Right(favoriteSongs);
    } catch (e) {
      return Left(Failure(0, "Some error occurred, please try again."));
    }
  }
}
