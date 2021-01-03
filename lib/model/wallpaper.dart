class Wallpaper{
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;

  Wallpaper({this.photographer,this.photographerUrl, this.photographerId, this.src});

  factory Wallpaper.fromMap(Map<String, dynamic> jsonData){
    return Wallpaper(
      src: SrcModel.fromMap(jsonData["src"]),
      photographerUrl: jsonData["photographer_url"],
      photographerId: jsonData["photographer_id"],
      photographer: jsonData["photographer"]
    );
  }

  // static Map<String, dynamic> toMap(Wallpaper wallpaper) =>{
  //  'photographer': wallpaper.photographer,
  //  'photographerUrl': wallpaper.photographerUrl,
  //  'photographerId': wallpaper.photographerId,
  //  'original': wallpaper.src.original,
  //  'small': wallpaper.src.small,
  //  'portrait': wallpaper.src.portrait,
  // };

  
}

class SrcModel{
  String original;
  String small;
  String portrait;

  SrcModel({this.original, this.portrait, this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(original: jsonData["original"],
    portrait: jsonData["portrait"],
    small: jsonData["small"]);
  }
}