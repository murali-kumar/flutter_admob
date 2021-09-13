import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Types of Google Ads'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              child: const Text('Banner Ad'),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text('Interstitial Ad'),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text('Rewarded Ad'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
