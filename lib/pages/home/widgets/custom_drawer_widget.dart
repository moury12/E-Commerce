import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/pages/home/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                ElevatedButton(
                    onPressed: () async {
                      Get.put(ProductController());
                      await ProductController.to.fetchFilteredProducts();
                      Get.to(ProductListWidget(filterProduct: ProductController.to.productList,));
                    },
                    child: const Text('Filter')),
                ...List.generate(HomeController.to.multilevelCategory.length, (index) {
                  final cat = HomeController.to.multilevelCategory[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(cat.name ?? ''),
                        onTap: () {
                          cat.selected!.value = !cat.selected!.value;
                          Get.put(ProductController());
                          ProductController.to.update();
                          ProductController.to.category.refresh();
                          final selectedIds = HomeController.to.multilevelCategory.
                          where((e) => e.selected!.value == true)
                              .map((e) =>
                              int.parse(e.id ?? '')).toSet().toList();
                          ProductController.to.category.value = selectedIds;
debugPrint('category : $selectedIds');
                        },
                        tileColor: cat.selected!.value ? Colors.blue.withOpacity(.4) : Colors.transparent,
                      ),
                      cat.selected!.value && cat.subItems!.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                children: List.generate(cat.subItems!.length, (index) {
                                  final subCat = cat.subItems![index];
                                  return Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          subCat.selected!.value = !subCat.selected!.value;
                                          Get.put(ProductController());
                                          ProductController.to.update();
                                          ProductController.to.subCategory.refresh();
                                          final selectedSubIds = HomeController.to.multilevelCategory
                                              .expand((e) => e.subItems!)
                                              .where((element) => element.selected!.value == true)
                                              .map((e) => int.parse(e.id ?? '')).toSet().toList();
                                          ProductController.to.subCategory.value = selectedSubIds;
                                          debugPrint('sub items $selectedSubIds');
                                          // final selectedSubIds =cat.subItems!.where((element) => element.selected!.value ==true).map((e) => int.parse(e.id??'')).toSet().toList();
                                          // ProductController.to.subCategory.value = selectedSubIds;
                                          // debugPrint('sub items $selectedSubIds');
                                        },
                                        tileColor: subCat.selected!.value ? Colors.blue.withOpacity(.4) : Colors.transparent,
                                        title: Text(subCat.name ?? ''),
                                      ),
                                      subCat.selected!.value && subCat.subSubItems!.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(left: 18.0),
                                              child: Column(
                                                children: List.generate(subCat.subSubItems!.length, (index) {
                                                  final sub = subCat.subSubItems![index];
                                                  return ListTile(
                                                    tileColor:sub.selected!.value?Colors.blueAccent:Colors.transparent ,
                                                    onTap: () {
                                                      sub.selected!.value=!sub.selected!.value;
                                                      Get.put(ProductController());
                                                      ProductController.to.update();
                                                      ProductController.to.childCategory.refresh();
                                                      final selectedChildId = HomeController.to.multilevelCategory.expand((element) => element.subItems!).expand((element) => element.subSubItems!)
                                                          .where((element) => element.selected!.value==true).map((e) => int.parse(e.id??'')).toSet().toList();
                                                      ProductController.to.childCategory.value= selectedChildId;
                                                      debugPrint('child items $selectedChildId');
                                                    },
                                                    title: Text(sub.name ?? ''),
                                                  );
                                                }),
                                              ),
                                            )
                                          : const SizedBox.shrink()
                                    ],
                                  );
                                }),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  );
                })
              ],
            ),
          ),
        );
      }),
    );
  }
}
