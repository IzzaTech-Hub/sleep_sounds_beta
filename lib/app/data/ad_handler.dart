import 'package:sleep_sounds_beta/app/provider/admob_ads_provider.dart';

class ShowAd{
  static int adCounter =0;
void checkad(){
if(adCounter==3){
    AdMobAdsProvider.instance.showInterstitialAd((){});
    adCounter=0;
    }
    else{
      adCounter++;
    }

}
}