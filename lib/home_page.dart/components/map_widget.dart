import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import 'package:map_test/home_page.dart/home_page_model.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageModel = context.watch<HomePageModel>();

    return FlutterMap(
      options: MapOptions(center: LatLng(43.021896, 44.680659)),
      mapController: context.read<HomePageModel>().mapController,
      children: [
        TileLayer(urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png"),
        MarkerLayer(markers: pageModel.markers),
      ],
    );
  }
}
