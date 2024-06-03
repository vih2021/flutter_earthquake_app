import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part '../models/locations.g.dart';


@JsonSerializable()
class Features {
  Features({
    required this.geometry,
    required this.id
  });

  factory Features.fromJson(Map<String, dynamic> json) =>
      _$FeaturesFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturesToJson(this);

  final Geometry geometry;
  final String id;
  
}

@JsonSerializable()
class Coordinates{
  final double x;
  final double y;
  final double z;

  Coordinates({
    required this.x,
    required this.y,
    required this.z,
  });

  factory Coordinates.fromList(List<dynamic> lista) {
    return Coordinates(
      x: lista[0].toDouble(),
      y: lista[1].toDouble(),
      z: lista[2].toDouble() ,
    );
  }

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Geometry{
  Geometry({
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  final Coordinates coordinates;
}

@JsonSerializable()
class Earthquakes {
  Earthquakes({
    required this.features
  });

  factory Earthquakes.fromJson(Map<String, dynamic> json) =>
      _$EarthquakesFromJson(json);
  Map<String, dynamic> toJson() => _$EarthquakesToJson(this);

  final List<Features> features;
}

/*
Future<Earthquakes> getEarthquakes(String day, String magnetude) async {

  final EarthquakesURL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/${magnetude}_${day}.geojson';
  //final EarthquakesURL = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2014-01-01&endtime=2014-01-02';
  print(EarthquakesURL);

  // Retrieve the locations of Google offices
  try {
    final response = await http.get(Uri.parse(EarthquakesURL));
    if (response.statusCode == 200) {
      return Earthquakes.fromJson(json.decode(response.body));
    }
  } catch (e) {
    print(e);
  }
  // Fallback for when the above HTTP request fails.
  return Earthquakes.fromJson(
    json.decode(
      await rootBundle.loadString('assets/locations.json'),
    ),
  );
}
*/