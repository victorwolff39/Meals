import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createWidget(
      String title, String description, bool value, Function(bool) onChange) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: (value) {
        onChange(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Filtros',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createWidget(
                      'Sem Glúten',
                      'Só exibe refeições sem glútem',
                      settings.isGlutenFree,
                      (value) => setState(() => settings.isGlutenFree = value)),
                  _createWidget(
                      'Sem Lactose',
                      'Só exibe refeições sem lactose',
                      settings.isLactoseFree,
                      (value) =>
                          setState(() => settings.isLactoseFree = value)),
                  _createWidget(
                      'Vegano',
                      'Só exibe refeições veganas',
                      settings.isVegan,
                      (value) => setState(() => settings.isVegan = value)),
                  _createWidget(
                      'Vegatariana',
                      'Só exibe refeições sem vegetarianas',
                      settings.isVegetarian,
                      (value) => setState(() => settings.isVegetarian = value)),
                ],
              ),
            ),
          ],
        ));
  }
}
