import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graphic_app/App/Controller/item_detail_controller.dart';
import 'package:get/get.dart';
import 'package:graphic_app/App/Utils/Const/aap_colors.dart';
import 'package:graphic_app/App/Utils/Theme/Extensions/text_theme_extension.dart';
import '../../Moddel/all_product_model.dart';
import '../../Widgets/Container/price_container.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String id;

  ItemDetailsScreen({super.key, required this.id});

  final ItemDetailController itemDetailController = Get.put(ItemDetailController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllProductModel>(
      future: itemDetailController.getProductById(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.blue),
            ),
          );
        } else if (snapshot.hasData) {
          final item = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(item.name, style: context.headlineMedium),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.network(
                          item.image,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      const Gap(18),
                      Text(
                        item.name,
                        style: context.bodyLarge,
                      ),
                      const Gap(8),
                      Text(
                        item.description,
                        style: context.bodySmall,
                      ),
                      const Gap(16),
                      PriceContainer(price: item.price.toString()),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("Error loading product details"),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("No product details available"),
            ),
          );
        }
      },
    );
  }
}
