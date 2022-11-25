import 'package:flutter/material.dart';

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    title: Text(
                      "Dark Mode",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Switch(
                      value: darkMode,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Switch(
                      value: notifications,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
