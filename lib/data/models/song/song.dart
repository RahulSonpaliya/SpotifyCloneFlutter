import '../../../domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  String? songId;
  bool? isFavorite;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.songId,
    required this.isFavorite,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    songId = data['songId'];
    isFavorite = data['isFavorite'];
  }

  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      songId: songId!,
      isFavorite: isFavorite!,
    );
  }
}
