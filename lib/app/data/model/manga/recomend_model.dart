// To parse this JSON data, do
//
//     final recomendManga = recomendMangaFromJson(jsonString);

import 'dart:convert';

RecomendManga recomendMangaFromJson(String str) => RecomendManga.fromJson(json.decode(str));

String recomendMangaToJson(RecomendManga data) => json.encode(data.toJson());

class RecomendManga {
    RecomendManga({
        this.malId,
        this.entry,
        this.content,
        this.date,
        this.user,
    });

    String? malId;
    List<Entry>? entry;
    String? content;
    DateTime? date;
    User? user;

    factory RecomendManga.fromJson(Map<String, dynamic> json) => RecomendManga(
        malId: json["mal_id"],
        entry: List<Entry>.from(json["entry"].map((x) => Entry.fromJson(x))),
        content: json["content"],
        date: DateTime.parse(json["date"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "entry": List<dynamic>.from(entry!.map((x) => x.toJson())),
        "content": content,
        "date": date!.toIso8601String(),
        "user": user!.toJson(),
    };
}

class Entry {
    Entry({
        this.malId,
        this.url,
        this.images,
        this.title,
    });

    int? malId;
    String? url;
    Map<String, Image>? images;
    String? title;

    factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"]).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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

class User {
    User({
        this.url,
        this.username,
    });

    String? url;
    String? username;

    factory User.fromJson(Map<String, dynamic> json) => User(
        url: json["url"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "username": username,
    };
}
