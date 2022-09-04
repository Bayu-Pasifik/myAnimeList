// To parse this JSON data, do
//
//     final manga = mangaFromJson(jsonString);

import 'dart:convert';

Manga mangaFromJson(String str) => Manga.fromJson(json.decode(str));

String mangaToJson(Manga data) => json.encode(data.toJson());

class Manga {
    Manga({
        this.malId,
        this.url,
        this.images,
        this.approved,
        this.titles,
        this.title,
        this.titleEnglish,
        this.titleJapanese,
        this.titleSynonyms,
        this.type,
        this.chapters,
        this.volumes,
        this.status,
        this.publishing,
        this.published,
        this.score,
        this.scored,
        this.scoredBy,
        this.rank,
        this.popularity,
        this.members,
        this.favorites,
        this.synopsis,
        this.background,
        this.authors,
        this.serializations,
        this.genres,
        this.explicitGenres,
        this.themes,
        this.demographics,
    });

    int? malId;
    String? url;
    Map<String, Image>? images;
    bool? approved;
    List<Title>? titles;
    String? title;
    String? titleEnglish;
    String? titleJapanese;
    List<String>? titleSynonyms;
    String? type;
    dynamic chapters;
    dynamic volumes;
    String? status;
    bool? publishing;
    Published? published;
    double? score;
    double? scored;
    int? scoredBy;
    int? rank;
    int? popularity;
    int? members;
    int? favorites;
    String? synopsis;
    String? background;
    List<Author>? authors;
    List<Author>? serializations;
    List<Author>? genres;
    List<dynamic>? explicitGenres;
    List<Author>? themes;
    List<Author>? demographics;

    factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        malId: json["mal_id"] ?? 0,
        url: json["url"],
        images: Map.from(json["images"]).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        approved: json["approved"],
        titles: List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: List<String>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"],
        chapters: json["chapters"],
        volumes: json["volumes"],
        status: json["status"],
        publishing: json["publishing"],
        published: Published.fromJson(json["published"]),
        score: json["score"].toDouble(),
        scored: json["scored"].toDouble(),
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        serializations: List<Author>.from(json["serializations"].map((x) => Author.fromJson(x))),
        genres: List<Author>.from(json["genres"].map((x) => Author.fromJson(x))),
        explicitGenres: List<dynamic>.from(json["explicit_genres"].map((x) => x)),
        themes: List<Author>.from(json["themes"].map((x) => Author.fromJson(x))),
        demographics: List<Author>.from(json["demographics"].map((x) => Author.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "approved": approved,
        "titles": List<dynamic>.from(titles!.map((x) => x.toJson())),
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": List<dynamic>.from(titleSynonyms!.map((x) => x)),
        "type": type,
        "chapters": chapters,
        "volumes": volumes,
        "status": status,
        "publishing": publishing,
        "published": published!.toJson(),
        "score": score,
        "scored": scored,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "authors": List<dynamic>.from(authors!.map((x) => x.toJson())),
        "serializations": List<dynamic>.from(serializations!.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "explicit_genres": List<dynamic>.from(explicitGenres!.map((x) => x)),
        "themes": List<dynamic>.from(themes!.map((x) => x.toJson())),
        "demographics": List<dynamic>.from(demographics!.map((x) => x.toJson())),
    };
}

class Author {
    Author({
        this.malId,
        this.type,
        this.name,
        this.url,
    });

    int? malId;
    Type ?type;
    String? name;
    String? url;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        malId: json["mal_id"],
        type: typeValues.map![json["type"]],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": typeValues.reverse![type],
        "name": name,
        "url": url,
    };
}

enum Type { PEOPLE, MANGA }

final typeValues = EnumValues({
    "manga": Type.MANGA,
    "people": Type.PEOPLE
});

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

class Published {
    Published({
        this.from,
        this.to,
        this.prop,
        this.string,
    });

    DateTime? from;
    dynamic to;
    Prop? prop;
    String? string;

    factory Published.fromJson(Map<String, dynamic> json) => Published(
        from: DateTime.parse(json["from"]),
        to: json["to"],
        prop: Prop.fromJson(json["prop"]),
        string: json["string"],
    );

    Map<String, dynamic> toJson() => {
        "from": from!.toIso8601String(),
        "to": to,
        "prop": prop!.toJson(),
        "string": string,
    };
}

class Prop {
    Prop({
        this.from,
        this.to,
    });

    From? from;
    From? to;

    factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
    );

    Map<String, dynamic> toJson() => {
        "from": from!.toJson(),
        "to": to!.toJson(),
    };
}

class From {
    From({
        this.day,
        this.month,
        this.year,
    });

    int? day;
    int? month;
    int? year;

    factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
    );

    Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
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

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
