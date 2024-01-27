import 'dart:convert';

List<Get> getFromJson(String str) =>
    List<Get>.from(json.decode(str).map((x) => Get.fromJson(x)));

String getToJson(List<Get> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Get {
  int? id;
  String? brand;
  String? name;
  String? price;
  PriceSign? priceSign;
  Currency? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  Category? category;
  ProductType? productType;
  List<String>? tagList;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColor>? productColors;

  Get({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  factory Get.fromJson(Map<String, dynamic> json) => Get(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        priceSign: priceSignValues.map[json["price_sign"]]!,
        currency: currencyValues.map[json["currency"]]!,
        imageLink: json["image_link"],
        productLink: json["product_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        category: categoryValues.map[json["category"]]!,
        productType: productTypeValues.map[json["product_type"]]!,
        tagList: json["tag_list"] == null
            ? []
            : List<String>.from(json["tag_list"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        productApiUrl: json["product_api_url"],
        apiFeaturedImage: json["api_featured_image"],
        productColors: json["product_colors"] == null
            ? []
            : List<ProductColor>.from(
                json["product_colors"]!.map((x) => ProductColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "price_sign": priceSignValues.reverse[priceSign],
        "currency": currencyValues.reverse[currency],
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating,
        "category": categoryValues.reverse[category],
        "product_type": productTypeValues.reverse[productType],
        "tag_list":
            tagList == null ? [] : List<dynamic>.from(tagList!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage,
        "product_colors": productColors == null
            ? []
            : List<dynamic>.from(productColors!.map((x) => x.toJson())),
      };
}

enum Category {
  bb_cc,
  concealer,
  contour,
  cream,
  empty,
  gel,
  highlighter,
  lipstick,
  lip_gloss,
  lip_stain,
  liquid,
  mineral,
  palette,
  pencil,
  powder
}

final categoryValues = EnumValues({
  "bb_cc": Category.bb_cc,
  "concealer": Category.concealer,
  "contour": Category.contour,
  "cream": Category.cream,
  "": Category.empty,
  "gel": Category.gel,
  "highlighter": Category.highlighter,
  "lipstick": Category.lipstick,
  "lip_gloss": Category.lip_gloss,
  "lip_stain": Category.lip_stain,
  "liquid": Category.liquid,
  "mineral": Category.mineral,
  "palette": Category.palette,
  "pencil": Category.pencil,
  "powder": Category.powder
});

enum Currency { cad, gbp, usd }

final currencyValues =
    EnumValues({"CAD": Currency.cad, "GBP": Currency.gbp, "USD": Currency.usd});

enum PriceSign { EMPTY, PRICE_SIGN }

final priceSignValues =
    EnumValues({"\u0024": PriceSign.EMPTY, "£": PriceSign.PRICE_SIGN});

class ProductColor {
  String? hexValue;
  String? colourName;

  ProductColor({
    this.hexValue,
    this.colourName,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName,
      };
}

enum ProductType {
  blush,
  bronzer,
  eyebrow,
  eyeliner,
  eyeshadow,
  foundation,
  lipstick,
  lip_liner,
  mascara,
  nail_polish
}

final productTypeValues = EnumValues({
  "blush": ProductType.blush,
  "bronzer": ProductType.bronzer,
  "eyebrow": ProductType.eyebrow,
  "eyeliner": ProductType.eyeliner,
  "eyeshadow": ProductType.eyeshadow,
  "foundation": ProductType.foundation,
  "lipstick": ProductType.lipstick,
  "lip_liner": ProductType.lip_liner,
  "mascara": ProductType.mascara,
  "nail_polish": ProductType.nail_polish
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
