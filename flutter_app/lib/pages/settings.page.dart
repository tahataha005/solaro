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
        child: Column(
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
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Dark Mode",
                    ),
                    trailing: Switch(
                      value: darkMode,
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
