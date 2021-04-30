import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen({this.saveFilters, this.currentFilter});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false,
      _vegetarian = false,
      _vegan = false,
      _lactoseFree = false;

  Widget _buildSwitchListTile(
      {bool defaultValue,
      String title,
      String subtitle,
      Function updateValue}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: defaultValue,
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
          ),
        ],
        title: Text(
          'Filters',
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    defaultValue: _glutenFree,
                    title: 'Gluten-free',
                    subtitle: 'Only include gluten-free meals',
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    defaultValue: _lactoseFree,
                    title: 'Lactose-free',
                    subtitle: 'Only include lactose-free meals',
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    defaultValue: _vegetarian,
                    title: 'Vegetarian',
                    subtitle: 'Only include vegetarian meals',
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    defaultValue: _vegan,
                    title: 'Vegan',
                    subtitle: 'Only include vegan meals',
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
