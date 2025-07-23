import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleep_sounds_beta/app/modules/home/controller/app_lovin_provider.dart';
import 'package:sleep_sounds_beta/app/modules/home/controller/custom_sound_ctl.dart';
import 'package:sleep_sounds_beta/app/provider/admob_ads_provider.dart';
import '../../utills/size_config.dart';
import '../controller/nav_view_ctl.dart';
import 'custom_sound_view.dart';

class NavView extends GetView<NavCTL> {
  const NavView({super.key});

  @override
  Widget build(BuildContext context) {
    CustomSoundCTL customSoundCTL = Get.find<CustomSoundCTL>();
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(() =>
          Container(child: controller.screens[controller.current_index.value])),
      bottomNavigationBar: Obx(() => BottomNavyBar(
            containerHeight: SizeConfig.blockSizeHorizontal * 18,
            backgroundColor: Colors.black,
            itemCornerRadius: 15,
            onItemSelected: (index) {
              customSoundCTL.stopAllSounds();
              controller.current_index.value = index;
              controller.navAdCounter++;
              if (controller.navAdCounter == 4) {
                // AppLovinProvider.instance.showInterstitial();
                AdMobAdsProvider.instance.showInterstitialAd((){});
                controller.navAdCounter = 0;
              }
            },
            selectedIndex: controller.current_index.value,
            items: [
              BottomNavyBarItem(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade600,
                  icon: Icon(
                    CupertinoIcons.music_note_2,
                  ),
                  title: Text(
                    "Sounds",
                    textAlign: TextAlign.center,
                  )),
              BottomNavyBarItem(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade500,
                  icon: Icon(Icons.graphic_eq_rounded),
                  title: Text(
                    "Custom",
                    textAlign: TextAlign.center,
                  )),
              BottomNavyBarItem(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade500,
                  icon: Icon(Icons.settings_suggest_outlined),
                  title: Text(
                    "Settings",
                    textAlign: TextAlign.center,
                  )),
            ],
          )),
    );
  }
}
