import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:places_app/helpers/location_helper.dart';
import 'package:places_app/screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentLocation() async {
    final location = await Location().getLocation();
    final previewUrl = LocationHelper.generateLocationPreviewImage(
        latitude: location.latitude!, longitude: location.longitude!);

    setState(() {
      _previewImageUrl = previewUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MapScreen(),
    ));
    if (selectedLocation == null) {
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null
              ? const Center(
                  child: Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                ))
              : Image.network(_previewImageUrl!,
                  fit: BoxFit.fill, width: double.infinity),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              onPressed: _getCurrentLocation,
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              onPressed: _selectOnMap,
              label: const Text('Select on Map'),
            )
          ],
        ),
      ],
    );
  }
}
