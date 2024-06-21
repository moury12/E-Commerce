class OrderCalculationModel {
  Order? order;
  List<OrderDetails>? orderDetails;
  String? totalItems;
  String? billingShippingInfo;

  OrderCalculationModel(
      {this.order,
        this.orderDetails,
        this.totalItems,
        this.billingShippingInfo});

  OrderCalculationModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
    totalItems = json['total_items'].toString()=='null'?'':json['total_items'].toString();
    billingShippingInfo = json['billing_shipping_info'].toString()=='null'?'':json['billing_shipping_info'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (orderDetails != null) {
      data['order_details'] =
          orderDetails!.map((v) => v.toJson()).toList();
    }
    data['total_items'] = totalItems;
    data['billing_shipping_info'] = billingShippingInfo;
    return data;
  }
}

class Order {
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
  String? orderNotes;

  Order(
      {this.orderNo,
        this.subtotal,
        this.deliveryCharge,
        this.totalWeight,
        this.discountAmount,
        this.couponCode,
        this.couponCodeDiscount,
        this.taxName,
        this.taxAmount,
        this.grandTotal,
        this.orderNotes});

  Order.fromJson(Map<String, dynamic> json) {
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
    orderNotes = json['order_notes'].toString()=='null'?'':json['order_notes'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['order_notes'] = orderNotes;
    return data;
  }
}

class OrderDetails {
  String? productId;
  String? name;
  String? image;
  String? price;
  String? quantity;
  String? weight;
  String? createdAt;
  String? discount;
  String? discountType;

  OrderDetails(
      {this.productId,
        this.name,
        this.image,
        this.price,
        this.quantity,
        this.weight,
        this.createdAt,
        this.discount,
        this.discountType});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'].toString()=='null'?'':json['product_id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    price = json['price'].toString()=='null'?'':json['price'].toString();
    quantity = json['quantity'].toString()=='null'?'':json['quantity'].toString();
    weight = json['weight'].toString()=='null'?'':json['weight'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    discount = json['discount'].toString()=='null'?'':json['discount'].toString();
    discountType = json['discount_type'].toString()=='null'?'':json['discount_type'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    data['weight'] = weight;
    data['created_at'] = createdAt;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    return data;
  }
}
