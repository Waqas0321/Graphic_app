import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:graphic_app/App/Moddel/all_product_model.dart';
import 'package:graphic_app/App/UI/Screens/item_detail_screen.dart';
import 'package:graphic_app/App/Utils/Const/aap_colors.dart';
import 'package:graphic_app/App/Utils/Theme/Extensions/text_theme_extension.dart';

import '../../Moddel/app_moddel.dart';
import '../Container/price_container.dart';
class ItemCard extends StatelessWidget {
  final AllProductModel item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('image url : ${item.image}');
    return GestureDetector(
      onTap: () => Get.to(ItemDetailsScreen(id: item.id,)),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  item.image,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.bodyLarge,
                    ),
                    Gap(4),
                    Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.bodySmall,
                    ),
                  ],
                ),
              ),
              Spacer(),
              PriceContainer(price: item.price.toString(),),
            ],
          ),
        ),
      ),
    );
  }
}

