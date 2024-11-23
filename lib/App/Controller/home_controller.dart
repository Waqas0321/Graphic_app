import 'package:get/get.dart';
import '../Moddel/all_product_model.dart';
import '../Moddel/lens_model_class.dart';
import '../Services/http_services.dart';

class HomeController extends GetxController {
  RxList<AllProductModel> items = <AllProductModel>[].obs;
  var selectedSubCategories = RxList<String>([]);
  var selectedCoatings = RxList<String>([]);
  var selectedThickness = RxList<String>([]);

  Future<void> getProducts(String index) async {
    try {
      List<AllProductModel> products = await HTTPServices().fetchProducts(index);
      items.assignAll(products);
      print("Your Lens Index Name : ${index}");
    } catch (error) {
      print("Error fetching products: $error");
    }
  }

  final RxInt selectedTabIndex = 0.obs;
  final RxString selectedTabName = ''.obs;
  final List<LensType> lensTypes = [
    LensType("Distance"),
    LensType("Reading"),
    LensType(
        "Multifocal", ["Sunglasses Lenses", "Clear Lenses", "Lenses that Change Colors"]),
    LensType("Office", ["Sunglasses Lenses", "Clear Lenses", "Lenses that Change Colors"]),
  ];

  final List<Coating> coatings = [
    Coating("Anti-Scratch"),
    Coating("Anti-Reflective"),
    Coating("Multi-Layer Coating"),
  ];

  final List<Thickness> thicknessOptions = [
    Thickness("Hyper-Thin"),
    Thickness("Ultra-Thin"),
    Thickness("Thin"),
    Thickness("Standard"),
  ];

  // Reactive variables
  // Rxn<String> selectedSubCategory =
  //     Rxn<String>(); // This stores the selected subcategory
  // Rxn<String> selectedCoating =
  //     Rxn<String>(); // This stores the selected coating
  // Rxn<Thickness> selectedThickness =
  //     Rxn<Thickness>(); // This stores the selected thickness
  // Rxn<LensType> selectedLensType = Rxn<LensType>();

  // Function to update the selected lens type and clear the subcategory
  // void updateLensType(LensType lensType) {
  //   selectedLensType.value = lensType;
  //   selectedSubCategory.value = null; // Reset selected subcategory
  // }

  // void selectThickness(Thickness thickness) {
  //   selectedThickness.value = thickness;
  // }

  List<String> getSubcategoriesForLensType(String lensTypeName) {
    if (lensTypeName == 'Multifocal') {
      return ["Sunglasses Lenses", "Clear Lenses", "Lenses that Change Colors"];
    } else if (lensTypeName == 'Office') {
      return ["Sunglasses Lenses", "Clear Lenses", "Lenses that Change Colors"];
    } else {
      return []; // No subcategories for other lens types
    }
  }
}
