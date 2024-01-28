import 'package:api_call/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}