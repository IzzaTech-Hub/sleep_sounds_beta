import 'package:get/get.dart';
import 'package:sleep_sounds_beta/app/modules/home/controller/custom_sound_ctl.dart';

class CustomSoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.put((CustomSoundCTL()));
  }
}
