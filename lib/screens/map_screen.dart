import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_app/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  final String address2 = '';

  const MapScreen(
      {Key? key,
      this.initialLocation = const PlaceLocation(
          latitude: 52.53, longitude: 21.09, address: 'text'),
      this.isSelecting = false})
      : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          zoom: 16,
            target: LatLng(widget.initialLocation.latitude,
                widget.initialLocation.longitude)),
      ),
      appBar: AppBar(
        title: const Text('Your Map'),
      ),
    );
  }
}
