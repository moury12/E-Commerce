class MyOrderDetailsModel {
  String? id;
  String? userId;
  String? orderNo;
  String? subtotal;
  String? deliveryCharge;
  String? totalWeight;
  String? discountAmount;
  String? couponCode;
  String? couponCodeDiscount;
  String? taxName;
  String? taxAmount;
  String? grandTotal;
  String? orderStatus;
  String? pathaoStatus;
  String? orderNotes;
  String? itemQuantity;
  String? createdAt;
  String? updatedAt;
  String? consignmentId;
  String? merchantOrderId;
  String? pathaoDeliveryFee;
  String? reason;
  List<OrderDetails>? orderDetails;
  Billing? billing;
  Shipping? shipping;

  MyOrderDetailsModel(
      {this.id,
        this.userId,
        this.orderNo,
        this.subtotal,
        this.deliveryCharge,
        this.totalWeight,
        this.discountAmount,
        this.couponCode,
        this.couponCodeDiscount,
        this.taxName,
        this.taxAmount,
        this.grandTotal,
        this.orderStatus,
        this.pathaoStatus,
        this.orderNotes,
        this.itemQuantity,
        this.createdAt,
        this.updatedAt,
        this.consignmentId,
        this.merchantOrderId,
        this.pathaoDeliveryFee,
        this.reason,
        this.orderDetails,
        this.billing,
        this.shipping});

  MyOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    userId = json['user_id'].toString()=='null'?'':json['user_id'].toString();
    orderNo = json['order_no'].toString()=='null'?'':json['order_no'].toString();
    subtotal = json['subtotal'].toString()=='null'?'':json['subtotal'].toString();
    deliveryCharge = json['delivery_charge'].toString()=='null'?'':json['delivery_charge'].toString();
    totalWeight = json['total_weight'].toString()=='null'?'':json['total_weight'].toString();
    discountAmount = json['discount_amount'].toString()=='null'?'':json['discount_amount'].toString();
    couponCode = json['coupon_code'].toString()=='null'?'':json['coupon_code'].toString();
    couponCodeDiscount = json['coupon_code_discount'].toString()=='null'?'':json['coupon_code_discount'].toString();
    taxName = json['tax_name'].toString()=='null'?'':json['tax_name'].toString();
    taxAmount = json['tax_amount'].toString()=='null'?'':json['tax_amount'].toString();
    grandTotal = json['grand_total'].toString()=='null'?'':json['grand_total'].toString();
    orderStatus = json['order_status'].toString()=='null'?'':json['order_status'].toString();
    pathaoStatus = json['pathao_status'].toString()=='null'?'':json['pathao_status'].toString();
    orderNotes = json['order_notes'].toString()=='null'?'':json['order_notes'].toString();
    itemQuantity = json['item_quantity'].toString()=='null'?'':json['item_quantity'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
    consignmentId = json['consignment_id'].toString()=='null'?'':json['consignment_id'].toString();
    merchantOrderId = json['merchant_order_id'].toString()=='null'?'':json['merchant_order_id'].toString();
    pathaoDeliveryFee = json['pathao_delivery_fee'].toString()=='null'?'':json['pathao_delivery_fee'].toString();
    reason = json['reason'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
    billing =
    json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    shipping = json['shipping'] != null
        ? Shipping.fromJson(json['shipping'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_no'] = orderNo;
    data['subtotal'] = subtotal;
    data['delivery_charge'] = deliveryCharge;
    data['total_weight'] = totalWeight;
    data['discount_amount'] = discountAmount;
    data['coupon_code'] = couponCode;
    data['coupon_code_discount'] = couponCodeDiscount;
    data['tax_name'] = taxName;
    data['tax_amount'] = taxAmount;
    data['grand_total'] = grandTotal;
    data['order_status'] = orderStatus;
    data['pathao_status'] = pathaoStatus;
    data['order_notes'] = orderNotes;
    data['item_quantity'] = itemQuantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['consignment_id'] = consignmentId;
    data['merchant_order_id'] = merchantOrderId;
    data['pathao_delivery_fee'] = pathaoDeliveryFee;
    data['reason'] = reason;
    if (orderDetails != null) {
      data['order_details'] =
          orderDetails!.map((v) => v.toJson()).toList();
    }
    if (billing != null) {
      data['billing'] = billing!.toJson();
    }
    if (shipping != null) {
      data['shipping'] = shipping!.toJson();
    }
    return data;
  }
}

class OrderDetails {
  String? id;
  String? orderId;
  String? productId;
  String? name;
  String? image;
  String? price;
  String? quantity;
  String? weight;
  String? discount;
  String? discountType;
  String? campaignName;
  String? colorId;
  String? sizeId;
  String? createdAt;
  String? updatedAt;

  OrderDetails(
      {this.id,
        this.orderId,
        this.productId,
        this.name,
        this.image,
        this.price,
        this.quantity,
        this.weight,
        this.discount,
        this.discountType,
        this.campaignName,
        this.colorId,
        this.sizeId,
        this.createdAt,
        this.updatedAt});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    orderId = json['order_id'].toString()=='null'?'':json['order_id'].toString();
    productId = json['product_id'].toString()=='null'?'':json['product_id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    price = json['price'].toString()=='null'?'':json['price'].toString();
    quantity = json['quantity'].toString()=='null'?'':json['quantity'].toString();
    weight = json['weight'].toString()=='null'?'':json['weight'].toString();
    discount = json['discount'].toString()=='null'?'':json['discount'].toString();
    discountType = json['discount_type'].toString()=='null'?'':json['discount_type'].toString();
    campaignName = json['campaign_name'].toString()=='null'?'':json['campaign_name'].toString();
    colorId = json['color_id'].toString()=='null'?'':json['color_id'].toString();
    sizeId = json['size_id'].toString()=='null'?'':json['size_id'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    data['weight'] = weight;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['campaign_name'] = campaignName;
    data['color_id'] = colorId;
    data['size_id'] = sizeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Billing {
  String? id;
  String? orderId;
  String? bFirstName;
  String? bLastName;
  String? bPhone;
  String? bEmail;
  String? bCityId;
  String? bCityName;
  String? bZoneId;
  String? bZoneName;
  String? bAreaId;
  String? bAreaName;
  String? bAddress;

  Billing(
      {this.id,
        this.orderId,
        this.bFirstName,
        this.bLastName,
        this.bPhone,
        this.bEmail,
        this.bCityId,
        this.bCityName,
        this.bZoneId,
        this.bZoneName,
        this.bAreaId,
        this.bAreaName,
        this.bAddress});

  Billing.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    orderId = json['order_id'].toString()=='null'?'':json['order_id'].toString();
    bFirstName = json['b_first_name'].toString()=='null'?'':json['b_first_name'].toString();
    bLastName = json['b_last_name'].toString()=='null'?'':json['b_last_name'].toString();
    bPhone = json['b_phone'].toString()=='null'?'':json['b_phone'].toString();
    bEmail = json['b_email'].toString()=='null'?'':json['b_email'].toString();
    bCityId = json['b_city_id'].toString()=='null'?'':json['b_city_id'].toString();
    bCityName = json['b_city_name'].toString()=='null'?'':json['b_city_name'].toString();
    bZoneId = json['b_zone_id'].toString()=='null'?'':json['b_zone_id'].toString();
    bZoneName = json['b_zone_name'].toString()=='null'?'':json['b_zone_name'].toString();
    bAreaId = json['b_area_id'].toString()=='null'?'':json['b_area_id'].toString();
    bAreaName = json['b_area_name'].toString()=='null'?'':json['b_area_name'].toString();
    bAddress = json['b_address'].toString()=='null'?'':json['b_address'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['b_first_name'] = bFirstName;
    data['b_last_name'] = bLastName;
    data['b_phone'] = bPhone;
    data['b_email'] = bEmail;
    data['b_city_id'] = bCityId;
    data['b_city_name'] = bCityName;
    data['b_zone_id'] = bZoneId;
    data['b_zone_name'] = bZoneName;
    data['b_area_id'] = bAreaId;
    data['b_area_name'] = bAreaName;
    data['b_address'] = bAddress;
    return data;
  }
}

class Shipping {
  String? id;
  String? orderId;
  String? sFirstName;
  String? sLastName;
  String? sPhone;
  String? sEmail;
  String? sCityId;
  String? sCityName;
  String? sZoneId;
  String? sZoneName;
  String? sAreaId;
  String? sAreaName;
  String? sAddress;

  Shipping(
      {this.id,
        this.orderId,
        this.sFirstName,
        this.sLastName,
        this.sPhone,
        this.sEmail,
        this.sCityId,
        this.sCityName,
        this.sZoneId,
        this.sZoneName,
        this.sAreaId,
        this.sAreaName,
        this.sAddress});

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    orderId = json['order_id'].toString()=='null'?'':json['order_id'].toString();
    sFirstName = json['s_first_name'].toString()=='null'?'':json['s_first_name'].toString();
    sLastName = json['s_last_name'].toString()=='null'?'':json['s_last_name'].toString();
    sPhone = json['s_phone'].toString()=='null'?'':json['s_phone'].toString();
    sEmail = json['s_email'].toString()=='null'?'':json['s_email'].toString();
    sCityId = json['s_city_id'].toString()=='null'?'':json['s_city_id'].toString();
    sCityName = json['s_city_name'].toString()=='null'?'':json['s_city_name'].toString();
    sZoneId = json['s_zone_id'].toString()=='null'?'':json['s_zone_id'].toString();
    sZoneName = json['s_zone_name'].toString()=='null'?'':json['s_zone_name'].toString();
    sAreaId = json['s_area_id'].toString()=='null'?'':json['s_area_id'].toString();
    sAreaName = json['s_area_name'].toString()=='null'?'':json['s_area_name'].toString();
    sAddress = json['s_address'].toString()=='null'?'':json['s_address'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['s_first_name'] = sFirstName;
    data['s_last_name'] = sLastName;
    data['s_phone'] = sPhone;
    data['s_email'] = sEmail;
    data['s_city_id'] = sCityId;
    data['s_city_name'] = sCityName;
    data['s_zone_id'] = sZoneId;
    data['s_zone_name'] = sZoneName;
    data['s_area_id'] = sAreaId;
    data['s_area_name'] = sAreaName;
    data['s_address'] = sAddress;
    return data;
  }
}
