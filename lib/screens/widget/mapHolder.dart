import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHolder extends StatefulWidget {
  const MapHolder({super.key, required this.long, required this.lat});

  final double long;
  final double lat;

  @override
  State<MapHolder> createState() => _MapHolderState();
}

class _MapHolderState extends State<MapHolder> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

   CameraPosition? hospitalLocation;

   @override
  void initState() {
     hospitalLocation= CameraPosition(
    target: LatLng(widget.long,widget.lat),
    zoom: 16,
  );

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.hybrid,
        scrollGesturesEnabled: false,
        initialCameraPosition: hospitalLocation!,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      
     
    );
  }

}
