import 'package:flutter/material.dart';

class CustomedSplashScreen extends StatefulWidget {
  const CustomedSplashScreen({super.key});

  @override
  State<CustomedSplashScreen> createState() => CustomedSplashScreenState();
}

class CustomedSplashScreenState extends State<CustomedSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: Image.asset(
                "assets/images/Logo-Only.png",
              ),
            ),
            Text(
              "Welcome to the Solaro",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
