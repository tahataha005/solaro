import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/main.drawer.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        toolbarHeight: 100,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      drawer: MainDrawer(title: "settings"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                onChanged: (value) {
                  print(value);
                  setState(() {
                    darkMode = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                "Notifications",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Switch(
                value: notifications,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    notifications = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
