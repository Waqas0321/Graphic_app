import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:graphic_app/App/Controller/login_controller.dart';
import 'package:graphic_app/App/Utils/Const/aap_colors.dart';
import 'package:graphic_app/App/Utils/Theme/Extensions/text_theme_extension.dart';

import '../../Widgets/TextField/custom_textfield.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final LogInControllar logInControllar = Get.put(LogInControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: logInControllar.formKey, // Assign the form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome!',
                style: context.headlineMedium?.copyWith(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                hint: 'Enter Email',
                controller: logInControllar.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  return null; // Return null if the input is valid
                },
              ), // Email field
              const Gap(18),
              CustomTextField(
                hint: 'Enter Password',
                controller: logInControllar.passwordController,
                obscureText: true, // If you want to hide the password input
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null; // Return null if the input is valid
                },
              ), // Password field
              const Gap(23),
              SizedBox(
                height: 45,
                child: Obx(
                      () => ElevatedButton(
                    onPressed: () {
                      logInControllar.logIn(); // Call the login function here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      foregroundColor: AppColors.white,
                    ),
                    child: logInControllar.isLoading.value
                        ? const CircularProgressIndicator(
                      color: AppColors.white,
                    )
                        : Text(
                      "Log In",
                      style: context.bodyLarge?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
