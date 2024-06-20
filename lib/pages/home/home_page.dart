import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/pages/filter_page.dart';
import 'package:angoragh_e_commerce/pages/product-details/productDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_drawer_widget.dart';
import 'widgets/product_list_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Get.toNamed(FilterScreen.routeName);
        }, icon: Icon(Icons.filter))],
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
      ),
      drawer: const CustomDrawerWidget(),
      body: Obx(() {
        return SingleChildScrollView(
          // controller: HomeController.to.scrollController,
          child: Column(
            children: [
              Image.network('${contstant.url}${HomeController.to.campingBanner.value.image}'),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: HomeController.to.bannerList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final banner = HomeController.to.bannerList[index];
                    return Image.network('${contstant.url}${banner.image}');
                  },
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(HomeController.to.categoryList.length, (index) {
                      final category = HomeController.to.categoryList[index];
                      return Column(
                        children: [
                          Image.network(
                            '${contstant.url}${category.image}',
                            height: 50,
                          ),
                          Text(category.name ?? '')
                        ],
                      );
                    })
                  ],
                ),
              ),
              Row(
                children: [
                  const Text('Seller Picks'),
                  ElevatedButton(onPressed: () {
                    Get.to(ProductListWidget(productModel:HomeController.to.sellerPickList));
                  }, child: Text('view more'))
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
                itemCount: HomeController.to.sellerPickList.length > 4 ? 4 : HomeController.to.sellerPickList.length,
                itemBuilder: (context, index) {
                  final sellerPicks = HomeController.to.sellerPickList[index];
                  return GestureDetector(
                    onTap: () {
                      if (sellerPicks.slug != null || sellerPicks.slug!.isNotEmpty) {
                        Get.put(ProductController());
                        ProductController.to.fetchProductDetails(sellerPicks.slug ?? '');
                        Get.toNamed(ProductDetailsScreen.routeName);
                      } else {
                        Get.snackbar('Sorry!', "Product details is not available.");
                      }
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(fit: BoxFit.fitWidth, '${contstant.url}${sellerPicks.mainImages ?? ''}'),
                        ),
                        Text(sellerPicks.name ?? ''),
                      ],
                    ),
                  );
                  // if (index == HomeController.to.sellerPickList.length) {
                  //   return HomeController.to.isLoading.value
                  //       ? Center(child: CircularProgressIndicator())
                  //       : SizedBox.shrink();
                  // }
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
