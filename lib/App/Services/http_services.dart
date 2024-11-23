import 'dart:convert';
import 'package:graphic_app/App/UI/Screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Moddel/all_product_model.dart';
import 'package:get/get.dart';

class HTTPServices {
  final String baseUrl =
      'https://lesnsesbackend.vercel.app'; // replace with your API URL

  Future<List<AllProductModel>> fetchProducts(String query) async {
    final response = await http.get(Uri.parse("$baseUrl/api/products/filter?primarylens=$query"));
    print("$baseUrl/api/products/filter?primarylens=$query");
    print(response.body);


    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data = jsonDecode(response.body);
      return data
          .map((productJson) => AllProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<AllProductModel> fetchProductById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/api/products/$id'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AllProductModel.fromJson(data); // Parse JSON to AllProductModel
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<void> logInUser(String email, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/api/user/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({"email": email, "password": password}));
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', email);
        Get.offAll(HomePage());

        Get.snackbar('Welcome', 'Successfully Login to Application');
      } else {
        Get.snackbar('Login Failed', 'Login failed: ${response.body}');
      }
    } catch (error) {
      Get.snackbar('Error', 'Error logging in: $error');
    }
  }
}
