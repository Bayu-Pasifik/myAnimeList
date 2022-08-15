// To parse this JSON data, do
//
//     final AnimeSearch = animeFromJson(jsonString);

import 'dart:convert';

AnimeSearch animeFromJson(String str) => AnimeSearch.fromJson(json.decode(str));

String animeToJson(AnimeSearch data) => json.encode(data.toJson());

class AnimeSearch {
  AnimeSearch({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  int? malId;
  String? url;
  Map<String, Image>? images;
  Trailer? trailer;
  bool? approved;
  List<Title>? titles;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? season;
  int? year;
  Broadcast? broadcast;
  List<Demographic>? producers;
  List<Demographic>? licensors;
  List<Demographic>? studios;
  List<Demographic>? genres;
  List<dynamic>? explicitGenres;
  List<Demographic>? themes;
  List<Demographic>? demographics;

  factory AnimeSearch.fromJson(Map<String, dynamic> json) => AnimeSearch(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"])
            .map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        trailer: Trailer.fromJson(json["trailer"]),
        approved: json["approved"],
        titles: List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: List<String>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: Aired.fromJson(json["aired"] == null ? "" : json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"] == null ? 0 : json["score"].toDouble(),
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        season: json["season"],
        year: json["year"],
        broadcast: Broadcast.fromJson(json["broadcast"]),
        producers: List<Demographic>.from(
            json["producers"].map((x) => Demographic.fromJson(x))),
        licensors: List<Demographic>.from(
            json["licensors"].map((x) => Demographic.fromJson(x))),
        studios: List<Demographic>.from(
            json["studios"].map((x) => Demographic.fromJson(x))),
        genres: List<Demographic>.from(
            json["genres"].map((x) => Demographic.fromJson(x))),
        explicitGenres:
            List<dynamic>.from(json["explicit_genres"].map((x) => x)),
        themes: List<Demographic>.from(
            json["themes"].map((x) => Demographic.fromJson(x))),
        demographics: List<Demographic>.from(
            json["demographics"].map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trailer": trailer?.toJson(),
        "approved": approved,
        "titles": List<dynamic>.from(titles!.map((x) => x.toJson())),
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": List<dynamic>.from(titleSynonyms!.map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired?.toJson(),
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "season": season,
        "year": year,
        "broadcast": broadcast!.toJson(),
        "producers": List<dynamic>.from(producers!.map((x) => x.toJson())),
        "licensors": List<dynamic>.from(licensors!.map((x) => x.toJson())),
        "studios": List<dynamic>.from(studios!.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "explicit_genres": List<dynamic>.from(explicitGenres!.map((x) => x)),
        "themes": List<dynamic>.from(themes!.map((x) => x.toJson())),
        "demographics":
            List<dynamic>.from(demographics!.map((x) => x.toJson())),
      };
}

class Aired {
  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  String? from;
  String? to;
  Prop? prop;
  String? string;

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"] == null ? "" : json["from"],
        to: json["to"] == null ? "" : json["to"],
        prop: Prop.fromJson(json["prop"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from?.toString(),
        "to": to?.toString(),
        "prop": prop?.toJson(),
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
        "from": from?.toJson(),
        "to": to?.toJson(),
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
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class Broadcast {
  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  String? day;
  String? time;
  String? timezone;
  String? string;

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"],
        time: json["time"],
        timezone: json["timezone"],
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "time": time,
        "timezone": timezone,
        "string": string,
      };
}

class Demographic {
  Demographic({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  int? malId;
  Type? type;
  String? name;
  String? url;

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: typeValues.map?[json["type"]],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": typeValues.reverse?[type],
        "name": name,
        "url": url,
      };
}

enum Type { AnimeSearch }

final typeValues = EnumValues({"AnimeSearch": Type.AnimeSearch});

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

class Trailer {
  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    this.images,
  });

  dynamic youtubeId;
  dynamic url;
  dynamic embedUrl;
  Images? images;

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json["youtube_id"],
        url: json["url"],
        embedUrl: json["embed_url"],
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "youtube_id": youtubeId,
        "url": url,
        "embed_url": embedUrl,
        "images": images?.toJson(),
      };
}

class Images {
  Images({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  dynamic imageUrl;
  dynamic smallImageUrl;
  dynamic mediumImageUrl;
  dynamic largeImageUrl;
  dynamic maximumImageUrl;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        maximumImageUrl: json["maximum_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "maximum_image_url": maximumImageUrl,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
