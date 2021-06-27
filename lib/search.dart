import 'dart:convert';

List<Search> searchFromJson(String str) =>
    List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
  Search({
    this.id,
    this.name,
    this.image,
    this.offerStatus,
    this.offerName,
    this.show,
    this.price,
    this.discountPer,
    this.discountNum,
    this.totalPrice,
    this.categoryId,
    this.categoryIds,
    this.brandId,
    this.categoryName,
    this.categoryNames,
    this.brandName,
    this.quantity,
    this.descriptionA,
    this.descriptionE,
    this.wherestatus,
  });

  int id;
  String name;
  dynamic image;
  dynamic offerStatus;
  dynamic offerName;
  dynamic show;
  dynamic price;
  dynamic discountPer;
  dynamic discountNum;
  dynamic totalPrice;
  dynamic categoryId;
  dynamic categoryIds;
  dynamic brandId;
  dynamic categoryName;
  dynamic categoryNames;
  dynamic brandName;
  dynamic quantity;
  dynamic descriptionA;
  dynamic descriptionE;
  dynamic wherestatus;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["Id"],
        name: json["Name"],
        image: json["Image"],
        offerStatus: json["OfferStatus"],
        offerName: json["OfferName"],
        show: json["Show"],
        price: json["Price"],
        discountPer: json["Discount_per"],
        discountNum: json["Discount_num"],
        totalPrice: json["TotalPrice"],
        categoryId: json["Category_Id"],
        categoryIds: json["Category_Ids"],
        brandId: json["Brand_Id"],
        categoryName: json["CategoryName"],
        categoryNames: json["CategoryNames"],
        brandName: json["BrandName"],
        quantity: json["Quantity"],
        descriptionA: json["Description_A"],
        descriptionE: json["Description_E"],
        wherestatus: json["wherestatus"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Image": image,
        "OfferStatus": offerStatus,
        "OfferName": offerName,
        "Show": show,
        "Price": price,
        "Discount_per": discountPer,
        "Discount_num": discountNum,
        "TotalPrice": totalPrice,
        "Category_Id": categoryId,
        "Category_Ids": categoryIds,
        "Brand_Id": brandId,
        "CategoryName": categoryName,
        "CategoryNames": categoryNames,
        "BrandName": brandName,
        "Quantity": quantity,
        "Description_A": descriptionA,
        "Description_E": descriptionE,
        "wherestatus": wherestatus,
      };
}
