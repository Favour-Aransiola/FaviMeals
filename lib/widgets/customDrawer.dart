import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_practice/screens/settings_screen.dart';
import 'package:third_practice/screens/tabs_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, TabScreen.routeName);
            },
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            )),
        InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            )),
      ]),
    );
  }
}
