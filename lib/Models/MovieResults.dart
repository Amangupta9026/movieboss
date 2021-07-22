// To parse this JSON data, do
//
//     final movieResultsModel = movieResultsModelFromJson(jsonString);

import 'dart:convert';

MovieResultsModel movieResultsModelFromJson(String str) => MovieResultsModel.fromJson(json.decode(str));

String movieResultsModelToJson(MovieResultsModel data) => json.encode(data.toJson());

class MovieResultsModel {
    MovieResultsModel({
        this.d,
        this.q,
        this.v,
    });

    List<D>? d;
    String? q;
    int? v;

    factory MovieResultsModel.fromJson(Map<String, dynamic> json) => MovieResultsModel(
        d: List<D>.from(json["d"].map((x) => D.fromJson(x))),
        q: json["q"],
        v: json["v"],
    );

    Map<String, dynamic> toJson() => {
        "d": List<dynamic>.from(d!.map((x) => x.toJson())),
        "q": q,
        "v": v,
    };
}

class D {
    D({
        this.i,
        this.id,
        this.l,
        this.q,
        this.rank,
        this.s,
        this.v,
        this.vt,
        this.y,
        this.yr,
    });

    I? i;
    String? id;
    String? l;
    String? q;
    int? rank;
    String? s;
    List<V>? v;
    int? vt;
    int? y;
    String? yr;

    factory D.fromJson(Map<String, dynamic> json) => D(
        i: I.fromJson(json["i"]),
        id: json["id"],
        l: json["l"],
        q: json["q"],
        rank: json["rank"],
        s: json["s"],
        v: json["v"] == null ? null : List<V>.from(json["v"].map((x) => V.fromJson(x))),
        vt: json["vt"] == null ? null : json["vt"],
        y: json["y"],
        yr: json["yr"] == null ? null : json["yr"],
    );

    Map<String, dynamic> toJson() => {
        "i": i!.toJson(),
        "id": id,
        "l": l,
        "q": q,
        "rank": rank,
        "s": s,
        "v": v == null ? null : List<dynamic>.from(v!.map((x) => x.toJson())),
        "vt": vt == null ? null : vt,
        "y": y,
        "yr": yr == null ? null : yr,
    };
}

class I {
    I({
        this.height,
        this.imageUrl,
        this.width,
    });

    int? height;
    String? imageUrl;
    int? width;

    factory I.fromJson(Map<String, dynamic> json) => I(
        height: json["height"],
        imageUrl: json["imageUrl"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "imageUrl": imageUrl,
        "width": width,
    };
}

class V {
    V({
        this.i,
        this.id,
        this.l,
        this.s,
    });

    I? i;
    String? id;
    String? l;
    String? s;

    factory V.fromJson(Map<String, dynamic> json) => V(
        i: I.fromJson(json["i"]),
        id: json["id"],
        l: json["l"],
        s: json["s"],
    );

    Map<String, dynamic> toJson() => {
        "i": i!.toJson(),
        "id": id,
        "l": l,
        "s": s,
    };
}
