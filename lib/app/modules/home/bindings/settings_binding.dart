import 'package:get/get.dart';
import 'package:sleep_sounds_beta/app/modules/home/controller/settings_ctl.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsCTL());
  }
}
