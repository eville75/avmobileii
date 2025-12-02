class PlaylistModel {
  final String id;
  final String title;
  final String thumbnailUrl;

  PlaylistModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  factory PlaylistModel.fromMap(Map<String, dynamic> map) {
    final snippet = map["snippet"];

    final thumbnails = snippet["thumbnails"];
    final thumb = thumbnails["high"]?["url"] ??
        thumbnails["medium"]?["url"] ??
        thumbnails["default"]?["url"] ??
        "";

    return PlaylistModel(
      id: map["id"]?["playlistId"] ?? "",
      title: snippet["title"] ?? "",
      thumbnailUrl: thumb,
    );
  }
}
