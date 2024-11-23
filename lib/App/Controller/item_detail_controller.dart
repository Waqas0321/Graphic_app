import 'package:get/get.dart';
import '../Moddel/all_product_model.dart';
import '../Services/http_services.dart';

class ItemDetailController extends GetxController {
  Future<AllProductModel> getProductById(String id) async {
    try {
      AllProductModel product = await HTTPServices().fetchProductById(id);
      return product;
    } catch (error) {
      print("Error fetching product: $error");
      rethrow;
    }
  }
}
