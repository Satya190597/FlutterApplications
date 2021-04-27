import 'package:flutter/material.dart';

// + 3rd party packages.
import 'package:provider/provider.dart';

// + Screens.
import 'screens/places_list_screen.dart';
import 'screens/add_place_screen.dart';

// + Providers.
import 'providers/great_places.dart';

// Main method - App start execute from main.
void main() {
  runApp(PlaceList());
}

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
