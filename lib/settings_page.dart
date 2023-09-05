import 'package:flutter/material.dart';
import 'package:iratus/theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectColor = 'green';

  @override
  Widget build(BuildContext context) {
    // Theme
    final themeProvider = Provider.of<ThemeProvider>(context);

    List<DropdownMenuItem<String>> generateDropdownItems() {
      List<DropdownMenuItem<String>> items = [];

      themeProvider.availibleSeeds.forEach((key, value) {
        items.add(DropdownMenuItem(value: key, child: Text(key)));
      });

      return items;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.shadow,
        title: const Center(
            child: Text(
          'Settings',
          style: TextStyle(
              fontFamily: 'PierceRoman', fontSize: 30, color: Colors.white),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
              width: 70,
              child: FilledButton.tonal(
                onPressed: () {
                  setState(() {
                    themeProvider.switchDarkMode();
                  });
                },
                child: Icon(
                    themeProvider.isDarkMode ? Icons.nightlight : Icons.sunny),
              ),
            ),
            DropdownButton(
                // items: const [
                //   DropdownMenuItem(value: 'green', child: Text('Green')),
                //   DropdownMenuItem(value: 'blue', child: Text('Blue')),
                //   DropdownMenuItem(value: 'pink', child: Text('Pink')),
                //   DropdownMenuItem(value: 'yellow', child: Text('Yellow')),
                // ],
                items: generateDropdownItems(),
                value: _selectColor,
                onChanged: (String? selectedValue) {
                  if (selectedValue is String) {
                    setState(() {
                      _selectColor = selectedValue;
                      themeProvider.updateSeed(selectedValue);
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
