class WallpaperModel {
  WallpaperModel(
      {this.photographer, this.photographerId, this.photographerUrl, this.src});
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData['src']),
      photographer: jsonData['photographer'],
      photographerId: jsonData['photographer_id'],
      photographerUrl: jsonData['photographer_url'],
    );
  }
}

class SrcModel {
  SrcModel({this.original, this.portrait, this.small});
  String original;
  String small;
  String portrait;
  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      original: jsonData['original'],
      portrait: jsonData['portrait'],
      small: jsonData['small'],
    );
  }
}
