import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class HomePageModel with ChangeNotifier {
  late final MapController _mapController;
  MapController get mapController => _mapController;
  List<Marker> markers = [
    Marker(
        point: LatLng(43.021896, 44.680659),
        builder: (ctx) => const Icon(
              Icons.location_on,
              color: Colors.blue,
              size: 48.0,
            ),
        height: 60),
  ];

  HomePageModel() {
    getCurrent();
    _mapController = MapController();
  }

  Future<void> getCurrent() async {
    _determinePosition().then((myPosition) async {
      _mapController.move(LatLng(myPosition.latitude, myPosition.longitude), 15);

      final myPositionMarker = Marker(
        point: LatLng(myPosition.latitude, myPosition.longitude),
        builder: (context) => Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)],
              color: const Color.fromARGB(255, 243, 33, 33),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(4),
          alignment: Alignment.center,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('Я', style: TextStyle(color: Color.fromARGB(255, 243, 33, 33))),
          ),
        ),
      );

      markers.add(myPositionMarker);
      notifyListeners();
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void zoomUp() {
    _mapController.move(_mapController.center, min(18, _mapController.zoom + 1));
  }

  void zoomDown() => _mapController.move(_mapController.center, _mapController.zoom - 1);
}
