import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  static String get bannerAdUnitId {
    const bannerTestId = 'ca-app-pub-3940256099942544/6300978111';

    if (Platform.isAndroid) {
      return kReleaseMode
          ? 'ca-app-pub-2445500101848308/5507644487'
          : bannerTestId;
    } else if (Platform.isIOS) {
      // TODO: ad iOS banner id
      return '<YOUR_IOS_BANNER_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    const intersticialTestId = 'ca-app-pub-3940256099942544/1033173712';

    if (Platform.isAndroid) {
      return kReleaseMode
          ? 'ca-app-pub-2445500101848308/9780666062'
          : intersticialTestId;
    } else if (Platform.isIOS) {
      // TODO: ad iOS interstitial id
      return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      // TODO: ad Android rewarded id
      return '<YOUR_ANDROID_REWARDED_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      // TODO: ad iOS rewarded id
      return '<YOUR_IOS_REWARDED_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
