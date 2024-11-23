import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Services/http_services.dart';

class LogInControllar extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  void logIn() async {
    // Validate the form
    if (!formKey.currentState!.validate()) {
      return; // If the form is not valid, exit the function
    }

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Set loading to true while logging in
    isLoading.value = true;

    try {
      await HTTPServices().logInUser(email, password);
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }
}
