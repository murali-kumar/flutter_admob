import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
//Google Admob service
  BannerAd? topBannerAd;
  BannerAd? largeBannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  final int _maxInterstitialFailedLoadAttempts = 3;
  final int _maxRewardedFailedLoadAttempts = 3;
  int _numInterstitialLoadAttempts = 0;
  int _numxRewardedLoadAttempts = 0;

  void createTopBannerAd() {
    topBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: BannerAd.testAdUnitId,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            //print('onAdLoaded');
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            //print('onAdFailedToLoad  + $error');
          },
          onAdOpened: (Ad ad) {
            //print('onAdOpened');
          },
          onAdClosed: (Ad ad) {
            //print('onAdClosed');
            ad.dispose();
            createTopBannerAd();
          },
        ))
      ..load();
  }

  void createLargeBannerAd() {
    largeBannerAd = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: BannerAd.testAdUnitId,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            //print('onAdLoaded');
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            //print('onAdFailedToLoad  + $error');
          },
          onAdOpened: (Ad ad) {
            //print('onAdOpened');
          },
          onAdClosed: (Ad ad) {
            //print('onAdClosed');
            ad.dispose();
            createTopBannerAd();
          },
        ))
      ..load();
  }

  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: InterstitialAd.testAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            //print('InterstitialAd failed to load: $error');
            _numInterstitialLoadAttempts += 1;
            interstitialAd = null;
            if (_numInterstitialLoadAttempts <=
                _maxInterstitialFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }

  void showInterstitialAd() {
    //print(interstitialAd);
    if (interstitialAd == null) {
      return;
    }

    interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        //print('$ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        //print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        //print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
      onAdImpression: (InterstitialAd ad) {
        //print('$ad impression occurred.');
      },
    );

    interstitialAd?.show();
    interstitialAd = null;
  }

  void createRewardedAd() {
    RewardedAd.load(
        adUnitId: RewardedAd.testAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            //print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            rewardedAd = ad;
            _numxRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            //print('RewardedAd failed to load: $error');
            _numxRewardedLoadAttempts += 1;
            rewardedAd = null;
            if (_numxRewardedLoadAttempts <= _maxRewardedFailedLoadAttempts) {
              createRewardedAd();
            }
          },
        ));
  }

  void showRewardedAd() {
    if (rewardedAd == null) {
      return;
    }

    rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        //print('$ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        //print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        //print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createRewardedAd();
      },
      onAdImpression: (RewardedAd ad) {
        //print('$ad impression occurred.');
      },
    );

    rewardedAd?.show(
      onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
        // Reward the user for watching an ad.
        //print("Adds Reward is ${rewardItem.amount}");
      },
    );
    rewardedAd = null;

    //------
  }

  void dispose() {
    topBannerAd?.dispose();
    largeBannerAd?.dispose();
    interstitialAd?.dispose();
    rewardedAd?.dispose();
  }
  //------------
}

final adMobService = AdMobService();
