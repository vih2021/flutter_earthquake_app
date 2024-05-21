// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Features _$FeaturesFromJson(Map<String, dynamic> json) => Features(
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      id: json['id'] as String,
    );

Map<String, dynamic> _$FeaturesToJson(Features instance) => <String, dynamic>{
      'geometry': instance.geometry,
      'id': instance.id,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      coordinates:
          Coordinates.fromList(json['coordinates'].cast<double>()),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'coordinates': instance.coordinates,
    };

Earthquakes _$EarthquakesFromJson(Map<String, dynamic> json) => Earthquakes(
      features: (json['features'] as List<dynamic>)
          .map((e) => Features.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EarthquakesToJson(Earthquakes instance) =>
    <String, dynamic>{
      'features': instance.features,
    };
