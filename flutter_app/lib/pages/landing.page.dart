import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          width: 180,
          child: Image.asset(
            "assets/images/Header-Logo.png",
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SizedBox(
            width: 100,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
