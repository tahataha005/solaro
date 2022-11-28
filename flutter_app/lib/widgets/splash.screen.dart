import 'package:flutter/material.dart';

class CustomedSplashScreen extends StatefulWidget {
  const CustomedSplashScreen({super.key});

  @override
  State<CustomedSplashScreen> createState() => Customed_SplashScreenState();
}

class Customed_SplashScreenState extends State<CustomedSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
