import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sleep_sounds_beta/app/modules/home/controller/settings_ctl.dart';
import 'package:sleep_sounds_beta/app/provider/admob_ads_provider.dart';

import '../../utills/app_strings.dart';
import '../../utills/images.dart';
import '../../utills/size_config.dart';

class SettingsView extends GetView<SettingsCTL> {
   SettingsView({super.key});

   // // // Banner Ad Implementation start // // //
//? Commented by jamal start
  late BannerAd myBanner;
  RxBool isBannerLoaded = false.obs;

  initBanner() {
    BannerAdListener listener = BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) {
        print('Ad loaded.');
        isBannerLoaded.value = true;
      },
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) {
        print('Ad opened.');
      },
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) {
        print('Ad closed.');
      },
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) {
        print('Ad impression.');
      },
    );

    myBanner = BannerAd(
      adUnitId: AppStrings.ADMOB_BANNER,
      size: AdSize.banner,
      request: AdRequest(),
      listener: listener,
    );
    myBanner.load();
  } //? Commented by jamal end

  /// Banner Ad Implementation End ///

  @override
  Widget build(BuildContext context) {
    initBanner();
    return Scaffold(
        body: Stack(children: [
      Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Image.asset(
          AppImages.background,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 5,
        ),
        child: Column(children: [
          Container(
            // width: SizeConfig.blockSizeHorizontal * 40,
            child: Center(
              child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.rateApp();
              // LaunchReview.launch(
              //   androidAppId: "com.relaxingsounds.relaxingmusicsleepsounds",
              // );
            },
            child: settings_btn(
                "Rate us",
                CupertinoIcons.hand_thumbsup_fill,
                "Help us to grow with your 5 star",
                Icons.arrow_forward_ios_rounded),
          ),
          GestureDetector(
            onTap: () {
              controller.ShareApp();
            },
            child: settings_btn("Invite your friends", Icons.person_add_alt_1,
                "Spread the World", Icons.arrow_forward_ios_rounded),
          ),

          verticalSpace(SizeConfig.blockSizeVertical * 1),
                          Obx(() => isBannerLoaded.value &&
                    AdMobAdsProvider.instance.isAdEnable.value
                ? Container(
                    height: AdSize.banner.height.toDouble(),
                    child: AdWidget(ad: myBanner))
                : Container()), 
            verticalSpace(SizeConfig.blockSizeVertical * 1),
          // Container(
          //   margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
          //   // height: 60,
          //   // color: Colors.amber,
          //   child: Center(
          //     child: MaxAdView(
          //         adUnitId: AppStrings.MAX_BANNER_ID,
          //         adFormat: AdFormat.banner,
          //         listener: AdViewAdListener(onAdLoadedCallback: (ad) {
          //           print('Banner widget ad loaded from ' + ad.networkName);
          //         }, onAdLoadFailedCallback: (adUnitId, error) {
          //           print('Banner widget ad failed to load with error code ' +
          //               error.code.toString() +
          //               ' and message: ' +
          //               error.message);
          //         }, onAdClickedCallback: (ad) {
          //           print('Banner widget ad clicked');
          //         }, onAdExpandedCallback: (ad) {
          //           print('Banner widget ad expanded');
          //         }, onAdCollapsedCallback: (ad) {
          //           print('Banner widget ad collapsed');
          //         })),
          //   ),
          // ),
          Spacer(),
          Text(
            "Sleep Sounds",
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            "Version: 1.0.4",
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 3,
                color: Colors.orange),
          )
        ]),
      )
    ]));
  }

  Padding settings_btn(
      String text1, IconData icon1, String text2, IconData icon2) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 4,
          left: SizeConfig.blockSizeHorizontal * 7,
          right: SizeConfig.blockSizeHorizontal * 5),
      child: Row(
        children: [
          Icon(
            icon1,
            color: Colors.white,
            size: SizeConfig.blockSizeHorizontal * 7,
          ),
          horizontalSpace(SizeConfig.blockSizeHorizontal * 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                text2,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                    color: Colors.orange),
              )
            ],
          ),
          Spacer(),
          Icon(
            icon2,
            color: Colors.white,
            size: SizeConfig.blockSizeHorizontal * 6,
          )
        ],
      ),
    );
  }
}
