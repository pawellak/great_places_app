import 'package:flutter/material.dart';
import 'package:places_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  } 
  AppBar buildAppBar(BuildContext ctx) {
    return AppBar(
      title: const Text('Your Places'),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(ctx).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add))
      ],
    );
  }

  Center buildBody() => const Center(
        child: CircularProgressIndicator(),
      );
}
