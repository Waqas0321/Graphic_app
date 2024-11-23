import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphic_app/App/Controller/home_controller.dart';
import 'package:graphic_app/App/UI/Auth/login_screen.dart';
import 'package:graphic_app/App/UI/Screens/tab_content.dart';
import 'package:graphic_app/App/Utils/Const/aap_colors.dart';
import 'package:graphic_app/App/Utils/Theme/Extensions/text_theme_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.lensTypes.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Our Multifocals',
            style: context.headlineMedium?.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('user_email');
                Get.offAll(LogInScreen());
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.white,
              ),
            ),
          ],
          bottom: TabBar(
            onTap: (index) {
              controller.selectedTabIndex.value = index;
              controller.selectedTabName.value = controller.lensTypes[index].name;
            },
            isScrollable: false,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.indigo,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 12,
            ),
            tabs: controller.lensTypes
                .map((lens) => Tab(
              text: lens.name,
            ))
                .toList(),
            indicatorWeight: 3.0,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          children: controller.lensTypes.map((lensType) {
            final tabIndex = controller.lensTypes.indexOf(lensType);
            return Obx(() {
              if (controller.selectedTabIndex.value == tabIndex) {
                return TabContent(
                  controller: controller,
                  lensType: lensType,
                );
              } else {
                return Center(child: Padding(
                    padding: EdgeInsets.only(top: Get.height* 0.3 ),
                    child: CircularProgressIndicator()));
              }
            });
          }).toList(),
        ),
      ),
    );
  }
}
