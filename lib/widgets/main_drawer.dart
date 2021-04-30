import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({String title, IconData icon, Function onPres}) {
    return ListTile(
      onTap: onPres,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
              title: 'Meals',
              icon: Icons.restaurant,
              onPres: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          buildListTile(
              title: 'Filters',
              icon: Icons.settings,
              onPres: () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              }),
        ],
      ),
    );
  }
}
