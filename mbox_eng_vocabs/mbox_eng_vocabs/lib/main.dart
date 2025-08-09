import 'package:flutter/material.dart';
import 'package:mbox_eng_vocabs/pages/pg_landing.dart';
import 'package:mbox_eng_vocabs/themes/theme_selector.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  runApp(
    MultiProvider( // Use MultiProvider to provide multiple ChangeNotifier instances
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeSelector()), // Provide ThemeSelector
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeSelector = context.watch<ThemeSelector>();

    return MaterialApp(
      title: 'MinBox English Vocabularies',
      theme: themeSelector.currentTheme,
      home: const PgLanding(),
    );
  }
}