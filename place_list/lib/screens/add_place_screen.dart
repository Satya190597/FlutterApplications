// + Default Package.
import 'package:flutter/material.dart';

// + Widget.
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  // Route Name.
  static const routeName = '/add-place';

  // Create State.
  @override
  _AddPlaceScreenState createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  var _titleController = TextEditingController();

  // Build.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add A New Place'),
      ),
      body: Column(
        // Stretch the UI elements to it's entire width.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10,),
                    ImageInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),

              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
