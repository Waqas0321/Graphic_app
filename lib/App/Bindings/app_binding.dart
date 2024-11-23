import 'package:get/get.dart';
import 'package:graphic_app/App/Controller/home_controller.dart';
import 'package:graphic_app/App/Controller/item_detail_controller.dart';
import 'package:graphic_app/App/Controller/login_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    //home
    Get.lazyPut(() => HomeController(),);
    Get.put(() => HomeController());

    //details
    Get.lazyPut(() => ItemDetailController(),);
    Get.put(()=> ItemDetailController());

    //LogIn
    Get.lazyPut(() => LogInControllar(),);
    Get.put(()=> LogInControllar());
  }

}