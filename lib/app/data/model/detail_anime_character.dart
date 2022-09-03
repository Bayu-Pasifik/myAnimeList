// To parse this JSON data, do
//
//     final detailAnimeCharacter = detailAnimeCharacterFromJson(jsonString);

import 'dart:convert';

DetailAnimeCharacter detailAnimeCharacterFromJson(String str) =>
    DetailAnimeCharacter.fromJson(json.decode(str));

String detailAnimeCharacterToJson(DetailAnimeCharacter data) =>
    json.encode(data.toJson());

class DetailAnimeCharacter {
  DetailAnimeCharacter({
    this.malId,
    this.url,
    this.images,
    this.name,
    this.nameKanji,
    this.nicknames,
    this.favorites,
    this.about,
    this.anime,
    this.manga,
    this.voices,
  });

  int? malId;
  String? url;
  DetailAnimeCharacterImages? images;
  String? name;
  String? nameKanji;
  List<String>? nicknames;
  int? favorites;
  String? about;
  List<AnimeElement>? anime;
  List<Manga>? manga;
  List<Voice>? voices;

  factory DetailAnimeCharacter.fromJson(Map<String, dynamic> json) =>
      DetailAnimeCharacter(
        malId: json["mal_id"],
        url: json["url"],
        images: DetailAnimeCharacterImages.fromJson(json["images"] ?? {}),
        name: json["name"],
        nameKanji: json["name_kanji"],
        nicknames: List<String>.from(
            json["nicknames"] == null ? [] : json["nicknames"].map((x) => x)),
        favorites: json["favorites"] ?? 0,
        about: json["about"],
        anime: List<AnimeElement>.from(json["anime"] == null
            ? []
            : json["anime"].map((x) => AnimeElement.fromJson(x))),
        manga: List<Manga>.from(json["manga"] != null
            ? json["manga"].map((x) => Manga.fromJson(x))
            : []),
        voices: List<Voice>.from(json["voices"] != null
            ? json["voices"].map((x) => Voice.fromJson(x))
            : []),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": images!.toJson(),
        "name": name,
        "name_kanji": nameKanji,
        "nicknames": List<dynamic>.from(nicknames!.map((x) => x)),
        "favorites": favorites,
        "about": about,
        "anime": List<dynamic>.from(anime!.map((x) => x.toJson())),
        "manga": List<dynamic>.from(manga!.map((x) => x.toJson())),
        "voices": List<dynamic>.from(voices!.map((x) => x.toJson())),
      };
}

class AnimeElement {
  AnimeElement({
    this.role,
    this.anime,
  });

  String? role;
  MangaClass? anime;

  factory AnimeElement.fromJson(Map<String, dynamic> json) => AnimeElement(
        role: json["role"],
        anime: MangaClass.fromJson(json["anime"]),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "anime": anime!.toJson(),
      };
}

class MangaClass {
  MangaClass({
    this.malId,
    this.url,
    this.images,
    this.title,
  });

  int? malId;
  String? url;
  Map<String, Image>? images;
  String? title;

  factory MangaClass.fromJson(Map<String, dynamic> json) => MangaClass(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"])
            .map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "title": title,
      };
}

class Image {
  Image({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class DetailAnimeCharacterImages {
  DetailAnimeCharacterImages({
    this.jpg,
    this.webp,
  });

  Jpg? jpg;
  Webp? webp;

  factory DetailAnimeCharacterImages.fromJson(Map<String, dynamic> json) =>
      DetailAnimeCharacterImages(
        jpg: Jpg.fromJson(json["jpg"] ?? {}),
        webp: Webp.fromJson(json["webp"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg!.toJson(),
        "webp": webp!.toJson(),
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

class Webp {
  Webp({
    this.imageUrl,
    this.smallImageUrl,
  });

  String? imageUrl;
  String? smallImageUrl;

  factory Webp.fromJson(Map<String, dynamic> json) => Webp(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
      };
}

class Manga {
  Manga({
    this.role,
    this.manga,
  });

  String? role;
  MangaClass? manga;

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        role: json["role"],
        manga: MangaClass.fromJson(json["manga"]),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "manga": manga!.toJson(),
      };
}

class Voice {
  Voice({
    this.person,
    this.language,
  });

  Person? person;
  String? language;

  factory Voice.fromJson(Map<String, dynamic> json) => Voice(
        person: Person.fromJson(json["person"]),
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "person": person!.toJson(),
        "language": language,
      };
}

class Person {
  Person({
    this.malId,
    this.url,
    this.images,
    this.name,
  });

  int? malId;
  String? url;
  PersonImages? images;
  String? name;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        malId: json["mal_id"],
        url: json["url"],
        images: PersonImages.fromJson(json["images"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": images!.toJson(),
        "name": name,
      };
}

class PersonImages {
  PersonImages({
    this.jpg,
  });

  Jpg? jpg;

  factory PersonImages.fromJson(Map<String, dynamic> json) => PersonImages(
        jpg: Jpg.fromJson(json["jpg"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg!.toJson(),
      };
}
