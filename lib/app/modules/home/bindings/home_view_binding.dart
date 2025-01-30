import 'package:get/get.dart';
import 'package:sleep_sounds_beta/app/modules/home/controller/home_view_ctl.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewCTL());
  }
}
