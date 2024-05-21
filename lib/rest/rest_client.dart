import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/locations.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('summary/{magnetude}_{day}.geojson')
  Future<Earthquakes> getEarthquakes(@Path('magnetude') String magnetude, @Path('day') String day);

}