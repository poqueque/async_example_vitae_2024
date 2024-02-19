// Generated from https://app.quicktype.io/

// To parse this JSON data, do
//
//     final zipCode = zipCodeFromJson(jsonString);

import 'dart:convert';

ZipCode zipCodeFromJson(String str) => ZipCode.fromJson(json.decode(str));

String zipCodeToJson(ZipCode data) => json.encode(data.toJson());

class ZipCode {
  String postCode;
  String country;
  String countryAbbreviation;
  List<Place> places;

  ZipCode({
    required this.postCode,
    required this.country,
    required this.countryAbbreviation,
    required this.places,
  });

  factory ZipCode.fromJson(Map<String, dynamic> json) => ZipCode(
        postCode: json["post code"],
        country: json["country"],
        countryAbbreviation: json["country abbreviation"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "post code": postCode,
        "country": country,
        "country abbreviation": countryAbbreviation,
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class Place {
  String placeName;
  String longitude;
  String state;
  String stateAbbreviation;
  String latitude;

  Place({
    required this.placeName,
    required this.longitude,
    required this.state,
    required this.stateAbbreviation,
    required this.latitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeName: json["place name"],
        longitude: json["longitude"],
        state: json["state"],
        stateAbbreviation: json["state abbreviation"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "place name": placeName,
        "longitude": longitude,
        "state": state,
        "state abbreviation": stateAbbreviation,
        "latitude": latitude,
      };
}
