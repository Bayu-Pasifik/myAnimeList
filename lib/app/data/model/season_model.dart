// To parse this JSON data, do
//
//     final season = seasonFromJson(jsonString);

import 'dart:convert';

Season seasonFromJson(String str) => Season.fromJson(json.decode(str));

String seasonToJson(Season data) => json.encode(data.toJson());

class Season {
    Season({
        this.year,
        this.seasons,
    });

    int? year;
    List<String>? seasons;

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json["year"],
        seasons: json["seasons"] == null ? null : List<String>.from(json["seasons"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "seasons": seasons == null ? null : List<dynamic>.from(seasons!.map((x) => x)),
    };
}
