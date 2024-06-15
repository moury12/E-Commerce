
class ProductDetailsModel {
  Products? products;
  String? countReview;
  LatestReviews? latestReviews;
  LatestReviews? oldestReviews;
  String? returnPolicy;
  SimilarProducts? similarProducts;
  SimilarProducts? recentlyViews;

  ProductDetailsModel(
      {this.products,
        this.countReview,
        this.latestReviews,
        this.oldestReviews,
        this.returnPolicy,
        this.similarProducts,
        this.recentlyViews});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
    countReview = json['count_review'].toString()=='null'?'':json['count_review'].toString();
    latestReviews = json['latest_reviews'] != null
        ? LatestReviews.fromJson(json['latest_reviews'])
        : null;
    oldestReviews = json['oldest_reviews'] != null
        ? LatestReviews.fromJson(json['oldest_reviews'])
        : null;
    returnPolicy = json['return_policy'].toString()=='null'?'':json['return_policy'].toString();
    similarProducts = json['similar_products'] != null
        ? SimilarProducts.fromJson(json['similar_products'])
        : null;
    recentlyViews = json['recently_views'] != null
        ? SimilarProducts.fromJson(json['recently_views'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.toJson();
    }
    data['count_review'] = countReview;
    if (latestReviews != null) {
      data['latest_reviews'] = latestReviews!.toJson();
    }
    if (oldestReviews != null) {
      data['oldest_reviews'] = oldestReviews!.toJson();
    }
    data['return_policy'] = returnPolicy;
    if (similarProducts != null) {
      data['similar_products'] = similarProducts!.toJson();
    }
    if (recentlyViews != null) {
      data['recently_views'] = recentlyViews!.toJson();
    }
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? slug;
  String? brand;
  String? price;
  String? discountPrice;
  String? discount;
  String? shortDetails;
  String? longDetails;
  String? howToUse;
  String? ingredient;
  String? weight;
  String? returnPolicy;
  String? mainImages;
  LatestReviews? latestReviews;
  LatestReviews? oldestReviews;
  List<String>? images;
  String? countReview;
  String? averageReview;
  List<Colors>? colors;
  List<Sizes>? sizes;

  Products(
      {this.id,
        this.name,
        this.slug,
        this.brand,
        this.price,
        this.discountPrice,
        this.discount,
        this.shortDetails,
        this.longDetails,
        this.howToUse,
        this.ingredient,
        this.weight,
        this.returnPolicy,
        this.mainImages,
        this.latestReviews,
        this.oldestReviews,
        this.images,
        this.countReview,
        this.averageReview,
        this.colors,
        this.sizes});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    brand = json['brand'].toString()=='null'?'':json['brand'].toString();
    price = json['price'].toString()=='null'?'':json['price'].toString();
    discountPrice = json['discount_price'].toString()=='null'?'':json['discount_price'].toString();
    discount = json['discount'].toString()=='null'?'':json['discount'].toString();
    shortDetails = json['short_details'].toString()=='null'?'':json['short_details'].toString();
    longDetails = json['long_details'].toString()=='null'?'':json['long_details'].toString();
    howToUse = json['how_to_use'].toString()=='null'?'':json['how_to_use'].toString();
    ingredient = json['ingredient'].toString()=='null'?'':json['ingredient'].toString();
    weight = json['weight'].toString()=='null'?'':json['weight'].toString();
    returnPolicy = json['return_policy'].toString()=='null'?'':json['return_policy'].toString();
    mainImages = json['main_images'].toString()=='null'?'':json['main_images'].toString();
    latestReviews = json['latest_reviews'] != null
        ? LatestReviews.fromJson(json['latest_reviews'])
        : null;
    oldestReviews = json['oldest_reviews'] != null
        ? LatestReviews.fromJson(json['oldest_reviews'])
        : null;
    images = json['images'].cast<String>();
    countReview = json['count_review'].toString()=='null'?'':json['count_review'].toString();
    averageReview = json['average_review'].toString()=='null'?'':json['average_review'].toString();
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(Colors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['brand'] = brand;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['discount'] = discount;
    data['short_details'] = shortDetails;
    data['long_details'] = longDetails;
    data['how_to_use'] = howToUse;
    data['ingredient'] = ingredient;
    data['weight'] = weight;
    data['return_policy'] = returnPolicy;
    data['main_images'] = mainImages;
    if (latestReviews != null) {
      data['latest_reviews'] = latestReviews!.toJson();
    }
    if (oldestReviews != null) {
      data['oldest_reviews'] = oldestReviews!.toJson();
    }
    data['images'] = images;
    data['count_review'] = countReview;
    data['average_review'] = averageReview;
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LatestReviews {
  List<Reviews>? reviews;
  String? averageRating;

  LatestReviews({this.reviews, this.averageRating});

  LatestReviews.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    averageRating = json['average_rating'].toString()=='null'?'':json['average_rating'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['average_rating'] = averageRating;
    return data;
  }
}

class Reviews {
  String? id;
  String? userId;
  String? productId;
  String? star;
  String? name;
  String? image;
  String? email;
  String? comments;
  String? status;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
        this.userId,
        this.productId,
        this.star,
        this.name,
        this.image,
        this.email,
        this.comments,
        this.status,
        this.createdAt,
        this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    userId = json['user_id'].toString()=='null'?'':json['user_id'].toString();
    productId = json['product_id'].toString()=='null'?'':json['product_id'].toString();
    star = json['star'].toString()=='null'?'':json['star'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    image = json['image'].toString()=='null'?'':json['image'].toString();
    email = json['email'].toString()=='null'?'':json['email'].toString();
    comments = json['comments'].toString()=='null'?'':json['comments'].toString();
    status = json['status'].toString()=='null'?'':json['status'].toString();
    createdAt = json['created_at'].toString()=='null'?'':json['created_at'].toString();
    updatedAt = json['updated_at'].toString()=='null'?'':json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['star'] = star;
    data['name'] = name;
    data['image'] = image;
    data['email'] = email;
    data['comments'] = comments;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Colors {
  String? id;
  String? name;

  Colors({this.id, this.name});

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}class Sizes {
  String? id;
  String? name;

  Sizes({this.id, this.name});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class SimilarProducts {
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

  SimilarProducts(
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

  SimilarProducts.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? slug;
  String? price;
  String? discount;
  String? discountedPrice;
  String? sold;
  String? mainImages;
  String? sellerPicks;
  String? sellerFlags;
  String? weight;
  String? reviewCount;
  String? averageStarRating;
  String? brand;
  String? category;

  Data(
      {this.id,
        this.name,
        this.slug,
        this.price,
        this.discount,
        this.discountedPrice,
        this.sold,
        this.mainImages,
        this.sellerPicks,
        this.sellerFlags,
        this.weight,
        this.reviewCount,
        this.averageStarRating,
        this.brand,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString()=='null'?'':json['id'].toString();
    name = json['name'].toString()=='null'?'':json['name'].toString();
    slug = json['slug'].toString()=='null'?'':json['slug'].toString();
    price = json['price'].toString()=='null'?'':json['price'].toString();
    discount = json['discount'].toString()=='null'?'':json['discount'].toString();
    discountedPrice = json['discounted_price'].toString()=='null'?'':json['discounted_price'].toString();
    sold = json['sold'].toString()=='null'?'':json['sold'].toString();
    mainImages = json['main_images'].toString()=='null'?'':json['main_images'].toString();
    sellerPicks = json['seller_picks'].toString()=='null'?'':json['seller_picks'].toString();
    sellerFlags = json['seller_flags'].toString()=='null'?'':json['seller_flags'].toString();
    weight = json['weight'].toString()=='null'?'':json['weight'].toString();
    reviewCount = json['review_count'].toString()=='null'?'':json['review_count'].toString();
    averageStarRating = json['average_star_rating'].toString()=='null'?'':json['average_star_rating'].toString();
    brand = json['brand'].toString()=='null'?'':json['brand'].toString();
    category = json['category'].toString()=='null'?'':json['category'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['price'] = price;
    data['discount'] = discount;
    data['discounted_price'] = discountedPrice;
    data['sold'] = sold;
    data['main_images'] = mainImages;
    data['seller_picks'] = sellerPicks;
    data['seller_flags'] = sellerFlags;
    data['weight'] = weight;
    data['review_count'] = reviewCount;
    data['average_star_rating'] = averageStarRating;
    data['brand'] = brand;
    data['category'] = category;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  String? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'].toString()=='null'?'':json['url'].toString();
    label = json['label'].toString()=='null'?'':json['label'].toString();
    active = json['active'].toString()=='null'?'':json['active'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}


