import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapServices extends StatefulWidget {
  const MapServices({Key? key}) : super(key: key);

  @override
  State<MapServices> createState() => MapServicesState();
}

class MapServicesState extends State<MapServices> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.2415951,35.5704917),
    zoom: 7.3,
  );

  static const CameraPosition _ourShop = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(31.968491, 35.877217),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHOP LOCATION!!!'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Our shop!!!!!'),
        icon: const Icon(Icons.shop_2_sharp),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_ourShop));
  }
}