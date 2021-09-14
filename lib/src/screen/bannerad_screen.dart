import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_admob/src/services/admobservice.dart';

class BannerAdScreen extends StatefulWidget {
  const BannerAdScreen({Key? key}) : super(key: key);

  @override
  _BannerAdScreenState createState() => _BannerAdScreenState();
}

class _BannerAdScreenState extends State<BannerAdScreen> {
  @override
  void initState() {
    adMobService.createTopBannerAd();
    adMobService.createLargeBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Ads'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          if (adMobService.topBannerAd != null) ...[
            Container(
              alignment: Alignment.center,
              //color: Colors.white,
              //width: adMobService.topBannerAd?.size.width.toDouble(),
              height: adMobService.topBannerAd?.size.height.toDouble(),
              child: AdWidget(ad: adMobService.topBannerAd!),
            ),
          ] else ...[
            const SizedBox(
              height: 50,
              child: Text('Cannot load banner'),
            )
          ],
          const SizedBox(
            height: 50,
          ),
          if (adMobService.largeBannerAd != null) ...[
            Container(
              alignment: Alignment.center,
              //color: Colors.white,
              //width: adMobService.topBannerAd?.size.width.toDouble(),
              height: adMobService.largeBannerAd?.size.height.toDouble(),
              child: AdWidget(ad: adMobService.largeBannerAd!),
            ),
          ] else ...[
            const SizedBox(
              height: 50,
              child: Text('Cannot load banner'),
            )
          ],
        ],
      ),
    );
  }
}
