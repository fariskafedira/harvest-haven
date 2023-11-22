// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int amount;
    String description;
    int user;
    String image;

    Fields({
        required this.name,
        required this.amount,
        required this.description,
        required this.user,
        required this.image,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        user: json["user"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "description": description,
        "user": user,
        "image": image,
    };
}
