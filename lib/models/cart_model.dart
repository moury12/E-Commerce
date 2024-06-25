class CartModel {
   int? id;
  String productId;
  String quantity;
  String productSlug;
  String? campaignId;

  CartModel({
     this.id,
    required this.productId,
    required this.productSlug,
    required this.quantity,
    this.campaignId,
  });

  Map<String, dynamic> toMap() {
    return {
      'cart_id': id,
      'product_id': productId,
      'product_slug': productSlug,
      'quantity': quantity,
      'campaign_id': campaignId,
    };
  }
  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
       id: map['cart_id'],
      productId: map['product_id'].toString()=='null'?'':map['product_id'].toString(),
      productSlug: map['product_slug'].toString()=='null'?'':map['product_slug'].toString(),
      quantity: map['quantity'].toString()=='null'?'':map['quantity'].toString(),
      campaignId: map['campaign_id'].toString()=='null'?'':map['campaign_id'].toString(),
    );
  }

}

class BillingShippingDetail {
  int? id;
  String bFirstName;
  String bLastName;
  String bPhone;
  String bEmail;
  String bDistrict;
  String bArea;
  String bAddress;
  String sFirstName;
  String sLastName;
  String sPhone;
  String sEmail;
  String sDistrict;
  String sArea;
  String sAddress;
  String orderNotes;
  String couponCode;

  BillingShippingDetail({
    this.id,
    required this.bFirstName,
    required this.bLastName,
    required this.bPhone,
    required this.bEmail,
    required this.bDistrict,
    required this.bArea,
    required this.bAddress,
    required this.sFirstName,
    required this.sLastName,
    required this.sPhone,
    required this.sEmail,
    required this.sDistrict,
    required this.sArea,
    required this.sAddress,
    required this.orderNotes,
    required this.couponCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'b_first_name': bFirstName,
      'b_last_name': bLastName,
      'b_phone': bPhone,
      'b_email': bEmail,
      'b_district': bDistrict,
      'b_area': bArea,
      'b_address': bAddress,
      's_first_name': sFirstName,
      's_last_name': sLastName,
      's_phone': sPhone,
      's_email': sEmail,
      's_district': sDistrict,
      's_area': sArea,
      's_address': sAddress,
      'order_notes': orderNotes,
      'coupon_code': couponCode,
    };
  }
}
