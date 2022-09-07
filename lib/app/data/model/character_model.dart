// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    this.character,
    this.role,
    this.favorites,
    this.voiceActors,
  });

  CharacterClass? character;
  String? role;
  int? favorites;
  List<VoiceActor>? voiceActors;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        character: CharacterClass.fromJson(json["character"]),
        role: json["role"],
        favorites: json["favorites"] ?? 0,
        voiceActors: List<VoiceActor>.from(json["voice_actors"] == null
            ? {}
            : json["voice_actors"].map((x) => VoiceActor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "character": character!.toJson(),
        "role": role,
        "favorites": favorites,
        "voice_actors": List<dynamic>.from(voiceActors!.map((x) => x.toJson())),
      };
}

class CharacterClass {
  CharacterClass({
    this.malId,
    this.url,
    this.images,
    this.name,
  });

  int? malId;
  String? url;
  CharacterImages? images;
  String? name;

  factory CharacterClass.fromJson(Map<String, dynamic> json) => CharacterClass(
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

class VoiceActor {
  VoiceActor({
    this.person,
    this.language,
  });

  Person? person;
  String? language;

  factory VoiceActor.fromJson(Map<String, dynamic> json) => VoiceActor(
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
