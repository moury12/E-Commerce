class OrderDataModel {
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
  String? orderNotes;
  String? itemQuantity;
  String? updatedAt;
  String? createdAt;
  String? id;

  OrderDataModel(
      {this.userId,
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
        this.orderNotes,
        this.itemQuantity,
        this.updatedAt,
        this.createdAt,
        this.id});

  OrderDataModel.fromJson(Map<String, dynamic> json) {
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
    orderNotes = json['order_notes'].toString()=='null'?'':json['order_notes'].toString();
    itemQuantity = json['item_quantity'].toString()=='null'?'':json['item_quantity'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    id = json['id'].toString()=='null'?'':json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['order_notes'] = orderNotes;
    data['item_quantity'] = itemQuantity;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
