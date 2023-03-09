import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/drawer_widget.dart';

class Filter_screen extends StatefulWidget {
  static const Filter_screen_routename = '/Filter_screen';
  final Map<String, bool> _filtercurrent;
  final Function _setFilters;
  Filter_screen(this._filtercurrent, this._setFilters);

  @override
  State<Filter_screen> createState() => _Filter_screenState();
}

class _Filter_screenState extends State<Filter_screen> {
  var _glutenfree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactosefree = false;

  @override
  initState() {
    _glutenfree = widget._filtercurrent['gluten'];
    _vegeterian = widget._filtercurrent['vegeterian'];
    _vegan = widget._filtercurrent['vegan'];
    _lactosefree = widget._filtercurrent['lactose'];
    super.initState();
  }

  get setFilters => widget._setFilters;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'vegan': _vegan,
                  'lactose': _lactosefree,
                  'vegeterian': _vegeterian
                };
                setFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: Drawer_widget(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Adjust your meal section",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten-free", 'Only include gluten-free meals', _glutenfree,
                  (newvalue) {
                setState(() {
                  _glutenfree = newvalue;
                });
              }),
              _buildSwitchListTile(
                  "Vegeterian", 'Only include vegeterian meals', _vegeterian,
                  (newvalue) {
                setState(() {
                  _vegeterian = newvalue;
                });
              }),
              _buildSwitchListTile("lactose-free",
                  'Only include lactose-free meals', _lactosefree, (newvalue) {
                setState(() {
                  _lactosefree = newvalue;
                });
              }),
              _buildSwitchListTile("Vegan", 'Only include Vegan meals', _vegan,
                  (newvalue) {
                setState(() {
                  _vegan = newvalue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
