import 'package:flutter/material.dart';
import 'package:flutter_app/providers/notifications.provider.dart';
import 'package:flutter_app/providers/theme.provider.dart';
import 'package:flutter_app/widgets/main.drawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<Themes>(context, listen: false).darkMode;
    bool showNotifications =
        Provider.of<Notifications>(context).showNotifications;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0.5,
      ),
      drawer: MainDrawer(
        title: "settings",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                "Dark Mode",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Switch(
                value: darkMode,
                onChanged: (value) =>
                    Provider.of<Themes>(context, listen: false)
                        .setDarkMode(value),
              ),
            ),
            ListTile(
              title: Text(
                "Notifications",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Switch(
                value: showNotifications,
                onChanged: (value) =>
                    Provider.of<Notifications>(context, listen: false)
                        .setShowNotifications(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
