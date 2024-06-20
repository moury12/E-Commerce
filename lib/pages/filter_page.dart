import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter-product';
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: List.generate(
                  HomeController.to.colorList.length,
                  (index) => Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                        child: Text(HomeController.to.colorList[index].name ?? ''),
                      )),
            ),
            Wrap(
              children: List.generate(HomeController.to.sizeList.length, (index) =>
                  Container(padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8), decoration:
                      BoxDecoration(border: Border.all(color: Colors.yellow)),
                      child: Text(HomeController.to.sizeList[index].name ?? ''))),
            ),
            Wrap(
              children: List.generate(
                  HomeController.to.brandList.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              '${contstant.url}${HomeController.to.brandList[index].image}',
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
                      )),
            )
          ],
        ),
      ),
    );
  }
}
