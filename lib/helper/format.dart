import 'dart:ffi';

format_song_data(data) {
  return SongData(
    id: data["id"],
    song: data["song"],
    album: data["album"],
    albumId: data["albumid"],
    image: data["image"].toString().replaceAll('150x150', '500x500'),
    artists: data["music"],
    duration: Duration(seconds: int.parse(data["duration"])),
    singers: data["singers"],
    language: data["language"],
    is_320kbps: data["320kbps"] != "false",
    encrypted_media_url: data["encrypted_media_url"],
    releaseDate: DateTime.parse(data["release_date"]),
    has_lyrics: data["has_lyrics"] != "false",
  );
}

class SongData {
  SongData(
      {required this.song,
      required this.album,
      required this.albumId,
      required this.image,
      required this.artists,
      required this.duration,
      required this.singers,
      required this.language,
      required this.is_320kbps,
      required this.encrypted_media_url,
      required this.releaseDate,
      required this.has_lyrics,
      required this.id});
  final String id;
  final String song;
  final String album;
  final String albumId;
  final String image;
  final String artists;
  final Duration duration;
  final String singers;
  final String language;
  final bool is_320kbps;
  final String encrypted_media_url;
  final DateTime releaseDate;
  final bool has_lyrics;
}
