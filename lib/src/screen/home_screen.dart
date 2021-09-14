import 'package:flutter/material.dart';
import 'package:flutter_admob/src/screen/bannerad_screen.dart';
import 'package:flutter_admob/src/services/admobservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    adMobService.createInterstitialAd();
  }

  @override
  void dispose() {
    adMobService.dispose();
    super.dispose();
  }

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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const BannerAdScreen()));
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text('Interstitial Ad'),
              onPressed: () {
                adMobService.showInterstitialAd();
              },
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
