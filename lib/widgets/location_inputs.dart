import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
   String? _previewImageUrl;

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
              ? const Center(child:  Text('No Location Chosen',textAlign: TextAlign.center,))
              : Image.network(_previewImageUrl!,
                  fit: BoxFit.fill, width: double.infinity),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            TextButton.icon(
              icon: const Icon(Icons.location_on),
              onPressed: () {},
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              onPressed: () {},
              label: const Text('Select on Map'),
            )
          ],
        ),
      ],
    );
  }
}