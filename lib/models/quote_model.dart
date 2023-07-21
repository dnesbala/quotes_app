// To parse this JSON data, do
//
//     final quoteModel = quoteModelFromJson(jsonString);

import 'dart:convert';

List<QuoteModel> quoteModelFromJson(String str) =>
    List<QuoteModel>.from(json.decode(str).map((x) => QuoteModel.fromJson(x)));

String quoteModelToJson(List<QuoteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuoteModel {
  final String q;
  final String a;
  final String h;

  QuoteModel({
    required this.q,
    required this.a,
    required this.h,
  });

  QuoteModel copyWith({
    String? q,
    String? a,
    String? h,
  }) =>
      QuoteModel(
        q: q ?? this.q,
        a: a ?? this.a,
        h: h ?? this.h,
      );

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        q: json["q"],
        a: json["a"],
        h: json["h"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "h": h,
      };
}
