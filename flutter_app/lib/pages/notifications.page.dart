import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/notifications.provider.dart';
import '../widgets/empty.state.dart';
import '../widgets/main.drawer.dart';
import '../widgets/notifications.card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final List notifications =
        Provider.of<Notifications>(context).getNotifications;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0.5,
      ),
      drawer: MainDrawer(title: "notifications"),
      body: notifications.isNotEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: notifications.reversed.map((notification) {
                return NotificationCard(notification: notification);
              }).toList(),
            )
          : EmptyState(text: "Empty Box"),
    );
  }
}
