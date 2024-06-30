import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/controllers/product_controller.dart';
import 'package:angoragh_e_commerce/models/my_order_details_model.dart';
import 'package:angoragh_e_commerce/models/my_order_details_model.dart';
import 'package:angoragh_e_commerce/models/my_order_list_model.dart';
import 'package:angoragh_e_commerce/models/order_data_model.dart';
import 'package:angoragh_e_commerce/models/user_model.dart';
import 'package:angoragh_e_commerce/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    getUserData();
    getUserOrderList();
    super.onInit();
  }

  static UserController get to => Get.find();

  Rx<UserModel> user = UserModel().obs;
  RxList<MyOrderListModel> userOrderList = <MyOrderListModel>[].obs;
  Rx<OrderDataModel> orderData = OrderDataModel().obs;
  Rx<MyOrderDetailsModel> orderDetailsData = MyOrderDetailsModel().obs;
  void getUserData() async {
    user.value = await UserService.fetchUserData(AuthController.to.token ?? '');
  }

  void getOrderData() async {
    orderData.value = await UserService.orderProduct({
      'order_details': ProductController.to.cartList
          .where(
            (e) => e.selected ?? false,
          )
          .map(
            (element) {
              return {'"product_id"': element.productId, '"quantity"': element.quantity, '"campaign_id"': element.campaignId, '"color_id"': element.colorId, '"size_id"': element.sizeId};
            },
          )
          .toList()
          .toString(),
      'billing_shipping_details': {
        '"b_first_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bFirstName,
        '"b_last_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bLastName,
        '"b_phone"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bPhone,
        '"b_email"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bEmail,
        '"b_district"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bZoneName,
        '"b_city_id"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bCityId,
        '"b_city_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bCityName,
        '"b_zone_id"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bZoneId,
        '"b_zone_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bZoneName,
        '"b_area_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bAreaName,
        '"b_area_id"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bAreaId,
        '"b_address"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].bAddress,
        '"s_first_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sFirstName,
        '"s_last_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sLastName,
        '"s_phone"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sPhone,
        '"s_email"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sEmail,
        '"s_district"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sZoneName,
        '"s_city_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sCityName,
        '"s_zone_id"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sZoneId,
        '"s_zone_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sZoneName,
        '"s_area_name"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sAreaName,
        '"s_area_id"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sAreaId,
        '"s_city_id"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sCityId,
        '"s_address"': UserController.to.user.value.userAddress == null ? 'test' : UserController.to.user.value.userAddress![0].sAddress
      },
      'order_notes': 'order notes',
      'coupon_code': 'Anghorag'
    }, AuthController.to.token ?? '');
  }

  void getUserOrderList() async {
    userOrderList.value = await UserService.fetchMyOrderList();
  }
  void getOrderDetails(String id) async {
    orderDetailsData.value = await UserService.fetchMyOderDetails(id);
  }
}
