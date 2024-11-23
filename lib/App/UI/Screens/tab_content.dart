import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../Controller/home_controller.dart';
import '../../Moddel/lens_model_class.dart';
import '../../Utils/Const/aap_colors.dart';
import '../../Widgets/Card/item_card.dart';

class TabContent extends StatelessWidget {
  final HomeController controller;
  final LensType lensType;

  const TabContent({Key? key, required this.controller, required this.lensType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (lensType.name == 'Multifocal' || lensType.name == 'Office')
                  Expanded(
                    child: Center(
                      child: PopupMenuButton<String>(
                        onSelected: (String value) {
                          // Toggle selection for subcategory
                          if (controller.selectedSubCategories
                              .contains(value)) {
                            controller.selectedSubCategories.remove(value);
                          } else {
                            controller.selectedSubCategories.add(value);
                          }
                          // Print the selected subcategories
                          print(
                              "Selected Subcategories: ${controller.selectedSubCategories}");
                        },
                        itemBuilder: (BuildContext context) {
                          return controller
                              .getSubcategoriesForLensType(lensType.name)
                              .map((sub) {
                            return PopupMenuItem<String>(
                              value: sub,
                              child: Row(
                                children: [
                                  Obx(() {
                                    return Checkbox(
                                      value: controller.selectedSubCategories
                                          .contains(sub),
                                      onChanged: (bool? selected) {
                                        // Toggle selection for subcategory
                                        if (selected != null) {
                                          if (selected) {
                                            controller.selectedSubCategories
                                                .add(sub);
                                          } else {
                                            controller.selectedSubCategories
                                                .remove(sub);
                                          }
                                          // Print the selected subcategories in real-time
                                          print(
                                              "Selected Subcategories: ${controller.selectedSubCategories}");
                                        }
                                      },
                                    );
                                  }),
                                  Text(sub),
                                ],
                              ),
                            );
                          }).toList();
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "SubCategory",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.keyboard_arrow_down,
                                size: 18, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Center(
                    child: PopupMenuButton<String>(
                      onSelected: (String value) {
                        // Toggle selection for coating
                        if (controller.selectedCoatings.contains(value)) {
                          controller.selectedCoatings.remove(value);
                        } else {
                          controller.selectedCoatings.add(value);
                        }
                        // Print the selected coatings
                        print(
                            "Selected Coatings: ${controller.selectedCoatings}");
                      },
                      itemBuilder: (BuildContext context) {
                        return controller.coatings.map((coating) {
                          return PopupMenuItem<String>(
                            value: coating.name,
                            child: Row(
                              children: [
                                Obx(() {
                                  return Checkbox(
                                    value: controller.selectedCoatings
                                        .contains(coating.name),
                                    onChanged: (bool? selected) {
                                      // Toggle selection for coating
                                      if (selected != null) {
                                        if (selected) {
                                          controller.selectedCoatings
                                              .add(coating.name);
                                        } else {
                                          controller.selectedCoatings
                                              .remove(coating.name);
                                        }
                                        // Print the selected coatings in real-time
                                        print(
                                            "Selected Coatings: ${controller.selectedCoatings}");
                                      }
                                    },
                                  );
                                }),
                                Text(coating.name),
                              ],
                            ),
                          );
                        }).toList();
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Coating",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          SizedBox(width: 2),
                          Icon(Icons.keyboard_arrow_down,
                              size: 18, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: PopupMenuButton<String>(
                      onSelected: (String value) {
                        // Toggle selection for coating
                        if (controller.selectedThickness.contains(value)) {
                          controller.selectedThickness.remove(value);
                        } else {
                          controller.selectedThickness.add(value);
                        }
                        // Print the selected coatings
                        print(
                            "Selected Thickness: ${controller.selectedThickness}");
                      },
                      itemBuilder: (BuildContext context) {
                        return controller.thicknessOptions.map((thickness) {
                          return PopupMenuItem<String>(
                            value: thickness.name,
                            child: Row(
                              children: [
                                Obx(() {
                                  return Checkbox(
                                    value: controller.selectedThickness
                                        .contains(thickness.name),
                                    onChanged: (bool? selected) {
                                      // Toggle selection for coating
                                      if (selected != null) {
                                        if (selected) {
                                          controller.selectedThickness
                                              .add(thickness.name);
                                        } else {
                                          controller.selectedThickness
                                              .remove(thickness.name);
                                        }
                                        // Print the selected coatings in real-time
                                        print(
                                            "Selected Thickness: ${controller.selectedThickness}");
                                      }
                                    },
                                  );
                                }),
                                Text(thickness.name),
                              ],
                            ),
                          );
                        }).toList();
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Thickness",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          SizedBox(width: 2),
                          Icon(Icons.keyboard_arrow_down,
                              size: 18, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(3),
            const Divider(color: AppColors.blue, thickness: 0.2),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: controller.getProducts(lensType.name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.3),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return Obx(() {
                      // Filter items based on selectedSubCategories, selectedCoatings, and selectedThickness
                      var filteredItems = controller.items.where((item) {
                        bool matchesSubCategories = true;
                        bool matchesCoatings = true;
                        bool matchesThickness = true;

                        if (controller.selectedSubCategories.isNotEmpty) {
                          matchesSubCategories = item.subcategories.any(
                              (subcategory) => controller.selectedSubCategories
                                  .contains(subcategory));
                        }

                        // Check coatings filter if selectedCoatings is not empty
                        if (controller.selectedCoatings.isNotEmpty) {
                          matchesCoatings = item.coatings.any((coating) =>
                              controller.selectedCoatings.contains(coating));
                        }

                        // Check thickness filter if selectedThickness is not empty
                        if (controller.selectedThickness.isNotEmpty) {
                          matchesThickness = item.thickness.any((thickness) =>
                              controller.selectedThickness.contains(thickness));
                        }

                         if(controller.selectedSubCategories.isEmpty || controller.selectedSubCategories == []){
                           return matchesCoatings && matchesThickness;
                         }
                         else{
                          return matchesCoatings && matchesThickness && matchesSubCategories;
                         }
                      }).toList();

                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.62,
                        ),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          // Debugging filtered results
                          print(
                              "Filtered Item Subcategories: ${filteredItems[index].subcategories}, Coatings: ${filteredItems[index].coatings}, Thickness: ${filteredItems[index].thickness}");
                          return ItemCard(item: filteredItems[index]);
                        },
                      );
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
