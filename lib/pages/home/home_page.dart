import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/pages/auth/login_page.dart';
import 'package:angoragh_e_commerce/pages/camping-details/camping_details_page.dart';
import 'package:angoragh_e_commerce/pages/filter_page.dart';
import 'package:angoragh_e_commerce/pages/product-details/product_details_page.dart';
import 'package:angoragh_e_commerce/pages/user/profile_page.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Get.put(ProductController());
                Get.toNamed(FilterScreen.routeName);
              },
              icon: const Icon(Icons.filter)),
          IconButton(
              onPressed: () {if(AuthController.to.token!.isNotEmpty&& AuthController.to.isLoggedIn.value){
                AuthController.to.getUserData();
                // Get.put(ProductController());
                Get.toNamed(ProfileScreen.routeName);
              }else{
                Get.toNamed(LoginScreen.routeName);
              }
    },
              icon: const Icon(Icons.account_box))
        ],
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
          child: Column(
            children: [
              Wrap(
                children: List.generate(
                    HomeController.to.campingTypeList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        HomeController.to.fetchCampingDetails(HomeController.to.campingTypeList[index].id??'');
                        Get.toNamed(CampingDetailsScreen.routeName);
                      },
                      child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: Color(int.parse(HomeController.to.campingTypeList[index].colorCode!.substring(1), radix: 16) + 0xFF000000)),
                            child: Text(
                              HomeController.to.campingTypeList[index].name ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                    )),
              ),
              Image.network('${Constant.url}${HomeController.to.campingBanner.value.image}'),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: HomeController.to.bannerList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final banner = HomeController.to.bannerList[index];
                    return Image.network('${Constant.url}${banner.image}');
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
                            '${Constant.url}${category.image}',
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
                  ElevatedButton(
                      onPressed: () {
                        Get.to(ProductListWidget(productModel: HomeController.to.sellerPickList));
                      },
                      child: const Text('view more'))
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
                          child: Image.network(fit: BoxFit.fitWidth, '${Constant.url}${sellerPicks.mainImages ?? ''}'),
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
