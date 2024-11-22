

class ProductsModel {
  int? limit, skip, total;
  List<ProductsDataModel>?products;

  ProductsModel({this.limit,this.skip,this.total,this.products});
  ///from json...
  factory ProductsModel.fromjson(Map<String,dynamic> json){
    List<ProductsDataModel> mProducts=[];
    for(Map<String,dynamic> eachProduc in json['products']){
      mProducts.add(ProductsDataModel.fromjson(eachProduc));
    }
    return ProductsModel(
      limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
      products:mProducts,
    );
  }
}

class MetaModel {
  String? products, createdAt, qrCode, updatedAt;
  MetaModel(
      {required this.products, required this.createdAt, required this.qrCode, required this.updatedAt});
  ///from json...
  factory MetaModel.fromjson(Map<String, dynamic> json){
    return MetaModel(
        products: json['products'],
        createdAt: json['createdAt'],
        qrCode: json['qrCode'],
        updatedAt: json['updatedAt']
    );
  }
}

class ReviewModel{
  String? comment,date,reviewerEmail,reviewerName;
  int? rating;

  ReviewModel({this.comment,this.date,this.reviewerEmail,this.reviewerName,this.rating});

  ///from json..
  factory ReviewModel.fromjson(Map<String,dynamic> json){
    return ReviewModel(
      comment: json['comment'],
      date:json['date'] ,
      rating:json['rating'] ,
      reviewerEmail: json['reviewerEmail'],
      reviewerName: json['reviewerName'],
    );
  }
}

class DimensionModel{
  num? depth,height,width;
  DimensionModel({this.depth,this.width,this.height});
  ///from json..
  factory DimensionModel.fromjson(Map<String,dynamic> json){
    return DimensionModel(
        height: json['height'],
        width: json['width'],
        depth: json['depth']
    );
  }
}

class ProductsDataModel{
  String? availabilityStatus;
  String? brand;
  String? category;
  String? description;
  DimensionModel? dimensions;
  num? discountPercentage;
  int?id;
  List<dynamic>? images;
  MetaModel?meta;
  int? minimumOrderQuantity;
  num?price;
  num?rating;
  String?returnPolicy;
  List<ReviewModel>? reviews;
  String? shippingInformation;
  String?sku;
  int?stock;
  List<dynamic>? tags;
  String? thumbnail;
  String? title;
  String? warrantyInformation;
  num?weight;

  ProductsDataModel(
      {
        this.availabilityStatus,
        this.brand,
        this.category,
        this.description,
        this.dimensions,
        this.discountPercentage,
        this.id,
        this.images,
        this.meta,
        this.minimumOrderQuantity,
        this.price,
        this.rating,
        this.returnPolicy,
        this.reviews,
        this.shippingInformation,
        this.sku,
        this.stock,
        this.tags,
        this.thumbnail,
        this.title,
        this.warrantyInformation,
        this.weight}

      );

  ///From json..
  factory ProductsDataModel.fromjson(Map<String,dynamic> json){
    List<ReviewModel> mreviews=[];
    for(Map<String,dynamic> eachReviews in json['reviews']){
      mreviews.add(ReviewModel.fromjson(eachReviews));
    }
    return ProductsDataModel(
      title: json['title'],
      description: json['description'],
      category: json['category'],
      availabilityStatus: json['availabilityStatus'],
      brand: json['brand'],
      returnPolicy: json['returnPolicy'],
      shippingInformation: json['shippingInformation'],
      sku: json['sku'],
      thumbnail: json['thumbnail'],
      warrantyInformation: json['warrantyInformation'],
      rating: json['rating'],
      discountPercentage: json['discountPercentage'],
      weight: json['weight'],
      price: json['price'],
      id: json['id'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      stock: json['stock'],
      dimensions: DimensionModel.fromjson(json['dimensions']),
      images: json['images'],
      reviews: mreviews,
      meta: MetaModel.fromjson(json['meta']),
      tags:json['tags'],

    );
  }
}
