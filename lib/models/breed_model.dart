import 'dart:convert';

import 'package:state_manager_in_flutter/models/models.dart';

class BreedModel {
  WeightModel weight;
  String id;
  String name;
  String temperament;
  String origin;
  String countryCodes;
  String countryCode;
  String lifeSpan;
  String wikipediaUrl;

  BreedModel({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.lifeSpan,
    required this.wikipediaUrl,
  });

  factory BreedModel.fromJson(String str) =>
      BreedModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BreedModel.fromMap(Map<String, dynamic> json) => BreedModel(
        weight: WeightModel.fromMap(json["weight"]),
        id: json["id"],
        name: json["name"],
        temperament: json["temperament"],
        origin: json["origin"],
        countryCodes: json["country_codes"],
        countryCode: json["country_code"],
        lifeSpan: json["life_span"],
        wikipediaUrl: json["wikipedia_url"],
      );

  Map<String, dynamic> toMap() => {
        "weight": weight.toMap(),
        "id": id,
        "name": name,
        "temperament": temperament,
        "origin": origin,
        "country_codes": countryCodes,
        "country_code": countryCode,
        "life_span": lifeSpan,
        "wikipedia_url": wikipediaUrl,
      };
}
