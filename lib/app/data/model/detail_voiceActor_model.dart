// To parse this JSON data, do
//
//     final detailVoiceActor = detailVoiceActorFromJson(jsonString);

import 'dart:convert';

DetailVoiceActor detailVoiceActorFromJson(String str) =>
    DetailVoiceActor.fromJson(json.decode(str));

String detailVoiceActorToJson(DetailVoiceActor data) =>
    json.encode(data.toJson());

class DetailVoiceActor {
  DetailVoiceActor({
    this.malId,
    this.url,
    this.websiteUrl,
    this.images,
    this.name,
    this.givenName,
    this.familyName,
    this.alternateNames,
    this.birthday,
    this.favorites,
    this.about,
    this.anime,
    this.manga,
    this.voices,
  });

  int? malId;
  String? url;
  dynamic websiteUrl;
  DetailVoiceActorImages? images;
  String? name;
  String? givenName;
  String? familyName;
  List<dynamic>? alternateNames;
  String? birthday;
  int? favorites;
  String? about;
  List<AnimeElement>? anime;
  List<dynamic>? manga;
  List<Voice>? voices;

  factory DetailVoiceActor.fromJson(Map<String, dynamic> json) =>
      DetailVoiceActor(
        malId: json["mal_id"],
        url: json["url"],
        websiteUrl: json["website_url"],
        images: DetailVoiceActorImages.fromJson(json["images"]),
        name: json["name"],
        givenName: json["given_name"],
        familyName: json["family_name"],
        alternateNames:
            List<dynamic>.from(json["alternate_names"].map((x) => x)),
        birthday: json["birthday"] ?? "0",
        favorites: json["favorites"],
        about: json["about"],
        anime: List<AnimeElement>.from(
            json["anime"].map((x) => AnimeElement.fromJson(x))),
        manga: List<dynamic>.from(json["manga"].map((x) => x)),
        voices: List<Voice>.from(json["voices"].map((x) => Voice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "website_url": websiteUrl,
        "images": images!.toJson(),
        "name": name,
        "given_name": givenName,
        "family_name": familyName,
        "alternate_names": List<dynamic>.from(alternateNames!.map((x) => x)),
        "birthday": birthday.toString(),
        "favorites": favorites,
        "about": about,
        "anime": List<dynamic>.from(anime!.map((x) => x.toJson())),
        "manga": List<dynamic>.from(manga!.map((x) => x)),
        "voices": List<dynamic>.from(voices!.map((x) => x.toJson())),
      };
}

class AnimeElement {
  AnimeElement({
    this.position,
    this.anime,
  });

  String? position;
  AnimeAnime? anime;

  factory AnimeElement.fromJson(Map<String, dynamic> json) => AnimeElement(
        position: json["position"],
        anime: AnimeAnime.fromJson(json["anime"]),
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "anime": anime!.toJson(),
      };
}

class AnimeAnime {
  AnimeAnime({
    this.malId,
    this.url,
    this.images,
    this.title,
  });

  int? malId;
  String? url;
  Map<String, Image>? images;
  String? title;

  factory AnimeAnime.fromJson(Map<String, dynamic> json) => AnimeAnime(
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

class DetailVoiceActorImages {
  DetailVoiceActorImages({
    this.jpg,
  });

  Jpg? jpg;

  factory DetailVoiceActorImages.fromJson(Map<String, dynamic> json) =>
      DetailVoiceActorImages(
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

class Voice {
  Voice({
    this.role,
    this.anime,
    this.character,
  });

  Role? role;
  AnimeAnime? anime;
  Character? character;

  factory Voice.fromJson(Map<String, dynamic> json) => Voice(
        role: roleValues.map![json["role"]],
        anime: AnimeAnime.fromJson(json["anime"]),
        character: Character.fromJson(json["character"]),
      );

  Map<String, dynamic> toJson() => {
        "role": roleValues.reverse![role],
        "anime": anime!.toJson(),
        "character": character!.toJson(),
      };
}

class Character {
  Character({
    this.malId,
    this.url,
    this.images,
    this.name,
  });

  int? malId;
  String? url;
  CharacterImages? images;
  String? name;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        malId: json["mal_id"],
        url: json["url"],
        images: CharacterImages.fromJson(json["images"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": images!.toJson(),
        "name": name,
      };
}

class CharacterImages {
  CharacterImages({
    this.jpg,
    this.webp,
  });

  Jpg? jpg;
  Webp? webp;

  factory CharacterImages.fromJson(Map<String, dynamic> json) =>
      CharacterImages(
        jpg: Jpg.fromJson(json["jpg"]),
        webp: Webp.fromJson(json["webp"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg!.toJson(),
        "webp": webp!.toJson(),
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

enum Role { MAIN, SUPPORTING }

final roleValues = EnumValues({
  "Main": Role.MAIN,
  "Supporting": Role.SUPPORTING,
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
