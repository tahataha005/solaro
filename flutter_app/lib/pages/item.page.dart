import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "assets/images/Item 1.png",
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
