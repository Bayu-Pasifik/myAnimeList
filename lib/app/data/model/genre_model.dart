// To parse this JSON data, do
//
//     final genre = genreFromJson(jsonString);

import 'dart:convert';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
    Genre({
        this.malId,
        this.name,
        this.url,
        this.count,
    });

    int? malId;
    String? name;
    String? url;
    int? count;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        malId: json["mal_id"],
        name: json["name"],
        url: json["url"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "name": name,
        "url": url,
        "count": count,
    };
}
