import 'package:flutter/material.dart';
import 'package:mbox_eng_vocabs/pages/pg_landing.dart';
import 'package:mbox_eng_vocabs/pages/pg_readme.dart';
import 'package:provider/provider.dart';
import 'package:mbox_eng_vocabs/themes/theme_selector.dart'; 

class CtrlAppEndDrawer extends StatelessWidget {
  const CtrlAppEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSelector = context.read<ThemeSelector>(); // Use .read if you only call methods and don't need to rebuild the drawer based on theme changes
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Use current theme's primary color
            ),
            child: Text(
              'App Settings',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text('Change Theme to Bluish'),
            onTap: () {
              themeSelector.setTheme('bluish');
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Change Theme to Greenish'),
            onTap: () {
              themeSelector.setTheme('greenish');
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more list tiles for other settings/navigation
          const Divider(),
          ListTile(
            title: const Text('Read Me'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PgReadMe()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Version 1.0')
          ),
          const Divider(),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PgLanding()),
              );
            },
          ),
        ],
      ),
    );
  }
}