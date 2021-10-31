import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:places_app/helpers/db_helper.dart';
import 'package:places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String pickedTitle,
    File? pickedImage,
  ) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage!,
      title: pickedTitle,
      location: PlaceLocation(longitude: 1, address: '', latitude: 1),
    );
    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');

    _items = dataList
        .map((place) {
          return Place(
            id: place['id'],
            image: File(place['image']),
            title: place['title'],
            location: PlaceLocation(longitude: 1, address: '', latitude: 1),
          );
        })
        .toList();

    notifyListeners();
  }
}
