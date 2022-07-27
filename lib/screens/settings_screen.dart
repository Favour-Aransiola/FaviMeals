import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_practice/widgets/customDrawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  Function saveFilter;
  final Map<String, bool> currentFilters;
  SettingsScreen(
      {Key? key, required this.saveFilter, required this.currentFilters})
      : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsStateScreen();
}

class _SettingsStateScreen extends State<SettingsScreen> {
  buildSwitchListTileWidget(String title, value, Function(bool) update) {
    return SwitchListTile(title: Text(title), value: value, onChanged: update);
  }

  bool _isGluten = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactose = false;

  @override
  void initState() {
    _isGluten = widget.currentFilters['gluten']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    _isLactose = widget.currentFilters['lactose']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                widget.saveFilter({
                  'gluten': _isGluten,
                  'lactose': _isLactose,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian
                });
                return;
              },
              icon: const Icon(Icons.save))
        ],
        title: Text(
          'Settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTileWidget('Vegan', _isVegan, (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  }),
                  buildSwitchListTileWidget('Vegetatian', _isVegetarian,
                      (value) {
                    setState(() {
                      _isVegetarian = value;
                    });
                  }),
                  buildSwitchListTileWidget('Lactose Free', _isLactose,
                      (value) {
                    setState(() {
                      _isLactose = value;
                    });
                  }),
                  buildSwitchListTileWidget('Gluten Free', _isGluten, (value) {
                    setState(() {
                      _isGluten = value;
                    });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
