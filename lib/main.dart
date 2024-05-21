import 'package:flutter/material.dart';
import 'package:flutter_earthquakes/models/search_params.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import './controllers/earthquake_controller.dart';
import './controllers/history_controller.dart';
import './binding/earthquake_binding.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LogHistoryController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: "/",
            page: () => GoogleMapsPage(),
            binding: EarthquakeBinding()),
      ],
    );
  }
}

class DropDownMenuDays extends StatefulWidget {

  const DropDownMenuDays({Key? key}) : super(key: key);

  @override
  _DropDownMenuDays createState() => _DropDownMenuDays();

}

class _DropDownMenuDays extends State<DropDownMenuDays> {
  List<DropdownMenuEntry<String>> list = [
    const DropdownMenuEntry<String>(value: "hour", label: "Past Hour"),
    const DropdownMenuEntry<String>(value: "day", label: "Past Day"),
    const DropdownMenuEntry<String>(value: "week", label: "Past 7 Days"),
    const DropdownMenuEntry<String>(value: "month", label: "Past 30 Days"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Title(color: Colors.black, child: const Text("Days")),
          DropdownMenu(
            initialSelection: CurrentSearchParams.getDay,
            width: 280.0,
            dropdownMenuEntries: list,
            onSelected: (value) {
              CurrentSearchParams.setDay = value!;
              
              Provider.of<LogHistoryController>(context, listen: false)
              .addLog(CurrentSearchParams.getMagnetude, CurrentSearchParams.day);

              Get.find<EarthquakeController>().getEarthquakes(CurrentSearchParams.getMagnetude, CurrentSearchParams.getDay);
            },
          )
        ],
      ),
    );
  }
}

class DropDownMenuMagnetude extends StatefulWidget {

  const DropDownMenuMagnetude({Key? key}) : super(key: key);

  @override
  _DropDownMenuMagnetude createState() => _DropDownMenuMagnetude();
  
}

class _DropDownMenuMagnetude extends State<DropDownMenuMagnetude> {
  List<DropdownMenuEntry<String>> list = [
    const DropdownMenuEntry<String>(
        value: "significant", label: "Significant Earthquakes"),
    const DropdownMenuEntry<String>(value: "4.5", label: "M4.5+ Earthquakes"),
    const DropdownMenuEntry<String>(value: "2.5", label: "M2.5+ Earthquakes"),
    const DropdownMenuEntry<String>(value: "1.0", label: "M1.0+ Earthquakes"),
    const DropdownMenuEntry<String>(value: "all", label: "All Earthquakes"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Title(color: Colors.black, child: const Text("Magnetude")),
          DropdownMenu(
            initialSelection: CurrentSearchParams.getMagnetude,
            width: 280.0,
            dropdownMenuEntries: list,
            onSelected: (value) {
                CurrentSearchParams.setMagnetude = value!;

                Provider.of<LogHistoryController>(context, listen: false)
                .addLog(CurrentSearchParams.getMagnetude, CurrentSearchParams.day);

                Get.find<EarthquakeController>().getEarthquakes(CurrentSearchParams.getMagnetude, CurrentSearchParams.getDay);

            },
          )
        ],
      ),
    );
  }
}

class GoogleMapsPage extends GetView<EarthquakeController> {

  GoogleMapsPage(){
    Get.find<EarthquakeController>().getEarthquakes(CurrentSearchParams.getMagnetude, CurrentSearchParams.getDay);
  }

  Set<Marker> createAndReturnMarkers(googleEarthquakes){
    final Map<String, Marker> _markers = {};

    _markers.clear();
      for (final earthquake in googleEarthquakes.features) {
        final marker = Marker(
          markerId: MarkerId(earthquake.id),
          position: LatLng(
              earthquake.geometry.coordinates.x, earthquake.geometry.coordinates.y),
        );
        _markers[earthquake.id] = marker;
      }

    return _markers.values.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Earthquake app"),
          backgroundColor: Colors.lightBlue,
        ),
        body: controller.obx((state) => GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 4
            
          ),
          markers: createAndReturnMarkers(state),
        ),
        ),
        drawer: const Drawer(
          child: Column(
            children: [DropDownMenuDays(), DropDownMenuMagnetude()],
          ),
        ),
      ),
    );
  }
}


