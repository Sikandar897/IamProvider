import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_2/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DarkTheme'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              //thememode 3 type ki hoti system, light and dark. system.
              title: const Text('lightMode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text('DarkMode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text('SystemtMode'),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme), 
              const Icon(Icons.favorite)
        ],
      ),
    );
  }
}
