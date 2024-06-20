class ProductModel {
  String? id;
  String? name;
  String? slug;
  String? mainImages;
  String? weight;
  String? price;
  String? discount;
  String? discountedPrice;
  String? sellerFlags;
  String? reviewCount;
  String? reviewAvgStar;
  // String? categoryId;
  // String? subcategoryId;
  // String? childcategoryId;
  // String? brandId;
  // List<String>? sizes;
  // List<String>? colors;

  ProductModel(
      {this.id,
        this.name,
        this.slug,
        this.mainImages,
        this.weight,
        this.price,
        this.discount,
        this.discountedPrice,
        this.sellerFlags,
        this.reviewCount,
        this.reviewAvgStar,
        // this.categoryId,
        // this.subcategoryId,
        // this.childcategoryId,
        // this.brandId,
        // this.sizes,
        // this.colors
      });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    mainImages = json['main_images'].toString()=='null'?'':json['main_images'].toString();
    weight = json['weight'].toString()=='null'?'':json['weight'].toString();
    price = json['price'].toString()=='null'?'':json['price'].toString();
    discount = json['discount'].toString()=='null'?'':json['discount'].toString();
    discountedPrice = json['discounted_price'].toString()=='null'?'':json['discounted_price'].toString();
    sellerFlags = json['seller_flags'].toString()=='null'?'':json['seller_flags'].toString();
    reviewCount = json['review_count'].toString()=='null'?'':json['review_count'].toString();
    reviewAvgStar = json['review_avg_star'].toString()=='null'?'':json['review_avg_star'].toString();
    // categoryId = json['category_id'].toString()=='null'?'':json['category_id'].toString();
    // subcategoryId = json['subcategory_id'].toString()=='null'?'':json['subcategory_id'].toString();
    // childcategoryId = json['childcategory_id'].toString()=='null'?'':json['childcategory_id'].toString();
    // brandId = json['brand_id'].toString()=='null'?'':json['brand_id'].toString();
    // sizes = json['sizes'].cast<String>();
    // colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['main_images'] = mainImages;
    data['weight'] = weight;
    data['price'] = price;
    data['discount'] = discount;
    data['discounted_price'] = discountedPrice;
    data['seller_flags'] = sellerFlags;
    data['review_count'] = reviewCount;
    data['review_avg_star'] = reviewAvgStar;
    // data['category_id'] = categoryId;
    // data['subcategory_id'] = subcategoryId;
    // data['childcategory_id'] = childcategoryId;
    // data['brand_id'] = brandId;
    // data['sizes'] = sizes;
    // data['colors'] = colors;
    return data;
  }
}
class FilteredProductModel {
  String? id;
  String? name;
  String? slug;
  String? mainImages;
  String? weight;
  String? price;
  String? discount;
  String? discountedPrice;
  String? sellerFlags;
  String? reviewCount;
  String? reviewAvgStar;
  String? categoryId;
  String? subcategoryId;
  String? childcategoryId;
  String? brandId;
  List<String>? sizes;
  List<String>? colors;

  FilteredProductModel(
      {this.id,
        this.name,
        this.slug,
        this.mainImages,
        this.weight,
        this.price,
        this.discount,
        this.discountedPrice,
        this.sellerFlags,
        this.reviewCount,
        this.reviewAvgStar,
        this.categoryId,
        this.subcategoryId,
        this.childcategoryId,
        this.brandId,
        this.sizes,
        this.colors
      });

  FilteredProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    mainImages = json['main_images'].toString()=='null'?'':json['main_images'].toString();
    weight = json['weight'].toString()=='null'?'':json['weight'].toString();
    price = json['price'].toString()=='null'?'':json['price'].toString();
    discount = json['discount'].toString()=='null'?'':json['discount'].toString();
    discountedPrice = json['discounted_price'].toString()=='null'?'':json['discounted_price'].toString();
    sellerFlags = json['seller_flags'].toString()=='null'?'':json['seller_flags'].toString();
    reviewCount = json['review_count'].toString()=='null'?'':json['review_count'].toString();
    reviewAvgStar = json['review_avg_star'].toString()=='null'?'':json['review_avg_star'].toString();
    categoryId = json['category_id'].toString()=='null'?'':json['category_id'].toString();
    subcategoryId = json['subcategory_id'].toString()=='null'?'':json['subcategory_id'].toString();
    childcategoryId = json['childcategory_id'].toString()=='null'?'':json['childcategory_id'].toString();
    brandId = json['brand_id'].toString()=='null'?'':json['brand_id'].toString();
    sizes = (json['sizes'] != null) ? List<String>.from(json['sizes']) : null;
    colors = (json['colors'] != null) ? List<String>.from(json['colors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['main_images'] = mainImages;
    data['weight'] = weight;
    data['price'] = price;
    data['discount'] = discount;
    data['discounted_price'] = discountedPrice;
    data['seller_flags'] = sellerFlags;
    data['review_count'] = reviewCount;
    data['review_avg_star'] = reviewAvgStar;
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    data['childcategory_id'] = childcategoryId;
    data['brand_id'] = brandId;
    data['sizes'] = sizes;
    data['colors'] = colors;
    return data;
  }
}
