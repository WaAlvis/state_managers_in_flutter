import 'dart:convert';

import 'package:state_manager_in_flutter/models/models.dart';

class CatImageResponse {
  String id;
  int width;
  int height;
  String url;
  List<BreedModel> breeds;

  CatImageResponse({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.breeds,
  });

  factory CatImageResponse.fromJson(String str) =>
      CatImageResponse.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory CatImageResponse.fromMap(Map<String, dynamic> json) =>
      CatImageResponse(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        breeds: List<BreedModel>.from(
            json["breeds"].map((x) => BreedModel.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //     "id": id,
  //     "width": width,
  //     "height": height,
  //     "url": url,
  //     "breeds": List<dynamic>.from(breeds.map((x) => x.toMap())),
  // };
}

class Weight {
  String imperial;
  String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromJson(String str) => Weight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weight.fromMap(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toMap() => {
        "imperial": imperial,
        "metric": metric,
      };
}
