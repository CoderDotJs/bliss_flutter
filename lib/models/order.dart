import 'dart:convert';

class Order {
    final Product? product;
    final String? user;
    final String? paymentId;
    final String? clientSecret;
    final int? price;
    final String? status;
    final String? createdAt;
    final String? updatedAt;

    Order({
        this.product,
        this.user,
        this.paymentId,
        this.clientSecret,
        this.price,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        user: json["user"],
        paymentId: json["paymentId"],
        clientSecret: json["client_secret"],
        price: json["price"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "user": user,
        "paymentId": paymentId,
        "client_secret": clientSecret,
        "price": price,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}

class Product {
    final String? name;
    final String? desc;
    final String? img;
    final int? price;
    final int? stock;

    Product({
        this.name,
        this.desc,
        this.img,
        this.price,
        this.stock,
    });

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        desc: json["desc"],
        img: json["img"],
        price: json["price"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "img": img,
        "price": price,
        "stock": stock,
    };
}
