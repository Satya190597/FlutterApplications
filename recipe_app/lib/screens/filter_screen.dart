import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class FilterScreen extends StatefulWidget {

  final Function saveFilter;
  final Map<String,bool> filters;

  FilterScreen(this.saveFilter,this.filters);

  static const String route_name = '/filter-screen';

  FilterScreenState createState() {
    return FilterScreenState();
  }
}

class FilterScreenState extends State<FilterScreen> {

  bool _gluetenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactose = false;

  initState() {
    _gluetenFree = widget.filters['gluten'];
    _vegeterian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactose = widget.filters['lactose'];
  }



  // SwitchList Builder Method.
  Widget switchListTileBuilder(String description, String title,
      bool switchValue, Function switchHandler) {
    return SwitchListTile(
      title: Text(title),
      value: switchValue,
      subtitle: Text(description),
      onChanged: (bool newValue) => switchHandler(newValue),
    );
  }

  // switch GluetenFree Handler.
  void switchGluetenFree(bool newValue) {
    setState(() {
      this._gluetenFree = newValue;
    });
  }

  // switch GluetenFree Handler.
  void switchVegeterian(bool newValue) {
    setState(() {
      this._vegeterian = newValue;
    });
  }

  // switch GluetenFree Handler.
  void switchVeganFree(bool newValue) {
    setState(() {
      this._vegan = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {
            widget.saveFilter({
              'gluten': _gluetenFree,
              'lactose': _lactose,
              'vegan': _vegan,
              'vegetarian': _vegeterian,
            });
          }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                switchListTileBuilder('Only Include Glutan Free Meals',
                    'Glutan-Free', _gluetenFree, this.switchGluetenFree),
                switchListTileBuilder('Only Include Vegeterian Free Meals',
                    'Vegeterian-Free', _vegeterian, this.switchVegeterian),
                switchListTileBuilder('Only Include Vegan Free Meals',
                    'Vegan-Free', _vegan, this.switchVeganFree),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
