import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 22,
          //fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            Icons.restaurant_menu,
            'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
