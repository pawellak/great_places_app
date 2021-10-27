import 'package:flutter/material.dart';
import 'package:places_app/widgets/image_inputs.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Column buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [buildExpanded(), buildElevatedButton()],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: const Text('Add Place'),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: Theme.of(context).colorScheme.secondary,
          onPrimary: Colors.black),
    );
  }

  Expanded buildExpanded() {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
              controller: _titleController,
            ),
            const SizedBox(
              height: 10,
            ),
            const ImageInputs()
          ],
        ),
      ),
    ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Add a new place'),
    );
  }
}
