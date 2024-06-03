import 'package:get/get.dart';
import '../models/locations.dart';
import '../rest/rest_client.dart';

class EarthquakeController extends GetxController with StateMixin <Earthquakes> {
  final RestClient _apiProvider = Get.find<RestClient>();

  void getEarthquakes(String magnetude, String day) {
      change(null, status: RxStatus.loading());
      _apiProvider.getEarthquakes(magnetude, day).then((response) {
        change(response, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    }
}
