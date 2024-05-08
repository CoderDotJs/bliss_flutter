import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int stock;
    String? img;
    double price;
    String desc;

    Product({
        required this.id,
        required this.name,
        required this.stock,
        required this.img,
        required this.price,
        required this.desc,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        stock: json["stock"],
        img: json["img"],
        price: json["price"]?.toDouble(),
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stock": stock,
        "img": img,
        "price": price,
        "desc": desc,
    };
}
