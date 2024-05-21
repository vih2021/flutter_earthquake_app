import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../controllers/earthquake_controller.dart';
import '../rest/rest_client.dart';

class EarthquakeBinding implements Bindings {
  @override
  void dependencies() {
    final dio = Dio();
    RestClient client = RestClient(dio);
    Get.put(client);

    Get.put(EarthquakeController());
  }
}