import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) =>
    List<CountriesModel>.from(json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  Name? name;
  String? region;
  int? population;
  Flags? flags;

  CountriesModel({
    this.name,
    this.region,
    this.population,
    this.flags,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    region: json["region"],
    population: json["population"],
    flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name?.toJson(),
    "region": region,
    "population": population,
    "flags": flags?.toJson(),
  };
}

class Name {
  String? common;

  Name({this.common});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
  );

  Map<String, dynamic> toJson() => {
    "common": common,
  };
}

class Flags {
  String? png;

  Flags({this.png});

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    png: json["png"],
  );

  Map<String, dynamic> toJson() => {
    "png": png,
  };
}
