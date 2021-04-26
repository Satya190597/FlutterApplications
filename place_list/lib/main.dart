import 'package:flutter/material.dart';

// + 3rd party packages.
import 'package:provider/provider.dart';

// + Screens.
import 'screens/places_list_screen.dart';

// + Providers.
import 'providers/great_places.dart';

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: PlaceList(),
      ),
    );
  }
}
