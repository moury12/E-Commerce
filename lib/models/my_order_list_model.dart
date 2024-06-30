class MyOrderListModel {
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

  MyOrderListModel(
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
        this.reason});

  MyOrderListModel.fromJson(Map<String, dynamic> json) {
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
    reason = json['reason'].toString()=='null'?'':json['reason'].toString();
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
    return data;
  }
}
