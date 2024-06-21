import 'product_details_model.dart';

class CampingDetailsModel {
  String? id;
  String? name;
  String? image;
  List<CategoryList>? categoryList;

  CampingDetailsModel({this.id, this.name, this.image, this.categoryList});

  CampingDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (categoryList != null) {
      data['category_list'] =
          categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  String? id;
  String? campaignNameId;
  String? categoryId;
  String? image;
  String? productListCount;
  ProductList? productList;

  CategoryList(
      {this.id,
        this.campaignNameId,
        this.categoryId,
        this.image,
        this.productListCount,
        this.productList});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    campaignNameId = json['campaign_name_id'].toString()=='null'?'':json['campaign_name_id'].toString();
    categoryId = json['category_id'].toString()=='null'?'':json['category_id'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    productListCount = json['product_list_count'].toString()=='null'?'':json['product_list_count'].toString();
    productList = json['product_list'] != null
        ? ProductList.fromJson(json['product_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['campaign_name_id'] = campaignNameId;
    data['category_id'] = categoryId;
    data['image'] = image;
    data['product_list_count'] = productListCount;
    if (productList != null) {
      data['product_list'] = productList!.toJson();
    }
    return data;
  }
}

class ProductList {
  String? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  String? from;
  String? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  String? to;
  String? total;

  ProductList(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  ProductList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    currentPage = json['current_page'].toString()=='null'?'':json['current_page'].toString();
    firstPageUrl = json['first_page_url'].toString()=='null'?'':json['first_page_url'].toString();
    from = json['from'].toString()=='null'?'':json['from'].toString();
    lastPage = json['last_page'].toString()=='null'?'':json['last_page'].toString();
    lastPageUrl = json['last_page_url'].toString()=='null'?'':json['last_page_url'].toString();
    nextPageUrl = json['next_page_url'].toString()=='null'?'':json['next_page_url'].toString();
    path = json['path'].toString()=='null'?'':json['path'].toString();
    perPage = json['per_page'].toString()=='null'?'':json['per_page'].toString();
    prevPageUrl = json['prev_page_url'].toString()=='null'?'':json['prev_page_url'].toString();
    to = json['to'].toString()=='null'?'':json['to'].toString();
    total = json['total'].toString()=='null'?'':json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  String? id;
  String? campaignId;
  String? campaignCategoryId;
  String? productId;
  String? currentPrice;
  String? percentDiscount;
  String? flatDiscount;
  String? createdAt;
  String? updatedAt;
  ProductInfo? productInfo;

  Data(
      {this.id,
        this.campaignId,
        this.campaignCategoryId,
        this.productId,
        this.currentPrice,
        this.percentDiscount,
        this.flatDiscount,
        this.createdAt,
        this.updatedAt,
        this.productInfo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    campaignId = json['campaign_id'].toString()=='null'?'':json['campaign_id'].toString();
    campaignCategoryId = json['campaign_category_id'].toString()=='null'?'':json['campaign_category_id'].toString();
    productId = json['product_id'].toString()=='null'?'':json['product_id'].toString();
    currentPrice = json['current_price'].toString()=='null'?'':json['current_price'].toString();
    percentDiscount = json['percent_discount'].toString()=='null'?'':json['percent_discount'].toString();
    flatDiscount = json['flat_discount'].toString()=='null'?'':json['flat_discount'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
    productInfo = json['product_info'] != null
        ? ProductInfo.fromJson(json['product_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['campaign_id'] = campaignId;
    data['campaign_category_id'] = campaignCategoryId;
    data['product_id'] = productId;
    data['current_price'] = currentPrice;
    data['percent_discount'] = percentDiscount;
    data['flat_discount'] = flatDiscount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productInfo != null) {
      data['product_info'] = productInfo!.toJson();
    }
    return data;
  }
}

class ProductInfo {
  String? id;
  String? name;
  String? slug;
  String? mainImages;
  String? weight;
  String? price;
  String? sellerFlags;
  String? reviewCount;
  String? reviewAvgStar;

  ProductInfo(
      {this.id,
        this.name,
        this.slug,
        this.mainImages,
        this.weight,
        this.price,
        this.sellerFlags,
        this.reviewCount,
        this.reviewAvgStar});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    mainImages = json['main_images'].toString()=='null'?'':json['main_images'].toString();
    weight = json['weight'].toString()=='null'?'':json['weight'].toString();
    price = json['price'].toString()=='null'?'':json['price'].toString();
    sellerFlags = json['seller_flags'].toString()=='null'?'':json['seller_flags'].toString();
    reviewCount = json['review_count'].toString()=='null'?'':json['review_count'].toString();
    reviewAvgStar = json['review_avg_star'].toString()=='null'?'':json['review_avg_star'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['main_images'] = mainImages;
    data['weight'] = weight;
    data['price'] = price;
    data['seller_flags'] = sellerFlags;
    data['review_count'] = reviewCount;
    data['review_avg_star'] = reviewAvgStar;
    return data;
  }
}


