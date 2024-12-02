class SongEntity {
  final String title;
  final String artist;
  final num duration;
  final String songId;
  final bool isFavorite;

  SongEntity({
    required this.title,
    required this.artist,
    required this.duration,
    required this.songId,
    required this.isFavorite,
  });
}
