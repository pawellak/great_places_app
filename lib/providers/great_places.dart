import 'package:flutter/material.dart';
import 'package:places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [...items];
  }
}
