import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/pages/home/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter-product';
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                ProductController.to.fetchFilteredProducts();
                Get.to(ProductListWidget(
                  filterProduct: ProductController.to.productList,
                ));
              },
              child: const Text('Filter'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: List.generate(
                  HomeController.to.colorList.length,
                  (index) => Obx(() {
                        return GestureDetector(
                          onTap: () {
                            HomeController.to.colorList[index].selected = !HomeController.to.colorList[index].selected!;
                            HomeController.to.colorList.refresh();
                            ProductController.to.update();
                            ProductController.to.colorList.value = HomeController.to.colorList.where((e) => e.selected == true).map((e) => int.parse(e.id ?? '')).toSet().toList();
                            debugPrint('${ProductController.to.colorList.toString()}----->colorList');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: HomeController.to.colorList[index].selected! ? Colors.green : Colors.transparent, border: Border.all(color: Colors.green)),
                            child: Text(HomeController.to.colorList[index].name ?? ''),
                          ),
                        );
                      })),
            ),
            Wrap(
              children: List.generate(HomeController.to.sizeList.length, (index) =>
                  Obx(
                    () {
                      return GestureDetector(
                        onTap: () {
                          HomeController.to.sizeList[index].selected = !HomeController.to.sizeList[index].selected!;
                          HomeController.to.sizeList.refresh();
                          // ProductController.to.update();
                          ProductController.to.sizeList.value = HomeController.to.sizeList.where((e) => e.selected == true).map((e) => int.parse(e.id ?? '')).toSet().toList();
                          debugPrint('${ProductController.to.sizeList.toString()}----->sizeList');
                        },
                        child: Container(padding: const EdgeInsets.all(8), margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(border: Border.all(color: Colors.yellow),color:  HomeController.to.sizeList[index].selected!?Colors.yellow:Colors.transparent),
                            child: Text(HomeController.to.sizeList[index].name ?? '')),
                      );
                    }
                  )),
            ),
            Wrap(
              children: List.generate(
                  HomeController.to.brandList.length,
                  (index) => Obx(() {
                        return GestureDetector(
                          onTap: () {
                            HomeController.to.brandList[index].selected = !HomeController.to.brandList[index].selected!;
                            HomeController.to.brandList.refresh();
                            // ProductController.to.update();
                            ProductController.to.brandList.value = HomeController.to.brandList.where((e) => e.selected == true).map((e) => int.parse(e.id ?? '')).toSet().toList();
                            debugPrint('${ProductController.to.brandList.toString()}----->brandList');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(height: 15,width: 15,decoration: BoxDecoration(
                                  color: HomeController.to.brandList[index].selected!?Colors.pink:Colors.transparent,
                                    shape: BoxShape.circle,border: Border.all(color: Colors.pink)),),
                                Image.network(
                                  '${Constant.url}${HomeController.to.brandList[index].image}',
                                  height: 50,
                                  width: 60,
                                  errorBuilder: (context, error, stackTrace) => const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 50,
                                  ),
                                ),
                                Text(HomeController.to.brandList[index].name ?? ''),
                              ],
                            ),
                          ),
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
