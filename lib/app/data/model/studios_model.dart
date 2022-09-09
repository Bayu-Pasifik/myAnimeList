// To parse this JSON data, do
//
//     final studios = studiosFromJson(jsonString);

import 'dart:convert';

Studios studiosFromJson(String str) => Studios.fromJson(json.decode(str));

String studiosToJson(Studios data) => json.encode(data.toJson());

class Studios {
  Studios({
    this.malId,
    this.url,
    this.titles,
    this.images,
    this.favorites,
    this.established,
    this.about,
    this.count,
  });

  int? malId;
  String? url;
  List<Title>? titles;
  Images? images;
  int? favorites;
  String? established;
  String? about;
  int? count;

  factory Studios.fromJson(Map<String, dynamic> json) => Studios(
        malId: json["mal_id"],
        url: json["url"],
        titles: List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
        images: Images.fromJson(json["images"]),
        favorites: json["favorites"],
        established: json["established"] ?? "0",
        about: json["about"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "titles": List<dynamic>.from(titles!.map((x) => x.toJson())),
        "images": images!.toJson(),
        "favorites": favorites,
        "established": established!.toString(),
        "about": about,
        "count": count,
      };
}

class Images {
  Images({
    this.jpg,
  });

  Jpg? jpg;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: Jpg.fromJson(json["jpg"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg!.toJson(),
      };
}

class Jpg {
  Jpg({
    this.imageUrl,
  });

  String? imageUrl;

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
      };
}

class Title {
  Title({
    this.type,
    this.title,
  });

  String? type;
  String? title;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
      };
}
