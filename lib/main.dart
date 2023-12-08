import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_2/provider/count_provider.dart';
import 'package:provider_example_2/provider/favourite_provider.dart';
import 'package:provider_example_2/provider/provider.dart';
import 'package:provider_example_2/provider/theme_changer_provider.dart';
//import 'package:provider_example_2/screens/dark_theme.dart';
import 'package:provider_example_2/screens/value_notify_listner.dart';
//import 'package:provider_example_2/screens/favourite/favourites_screen.dart';
//import 'package:provider_example_2/screens/provider_example_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleProvider()),
          ChangeNotifierProvider(create: (_) => FavouritItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider())
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider Statemangment',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                foregroundColor: Colors.white,
                backgroundColor: Colors.red),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.pink,
              primaryColor: Colors.purple,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
              iconTheme: const IconThemeData(color: Colors.red),
              useMaterial3: true,
            ),
            home: const NotifyListnerScreen(),
          );
        }));
  }
}
