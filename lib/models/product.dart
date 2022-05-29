class Product {
  String name;
  String image;
  String details;
  String brand;
  String price;
  String image2;
  String image3;
  String image4;
  String image5;
  String color;
  String cat;
  bool bestsell;
  Product({
    required this.name,
    required this.image,
    required this.details,
    required this.brand,
    required this.price,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.color,
    required this.cat,
    required this.bestsell,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'details': details});
    result.addAll({'brand': brand});
    result.addAll({'price': price});
    result.addAll({'image2': image2});
    result.addAll({'image3': image3});
    result.addAll({'image4': image4});
    result.addAll({'image5': image5});
    result.addAll({'color': color});
    result.addAll({'cat': cat});
    result.addAll({'bestsell': bestsell});

    return result;
  }

  factory Product.fromMap(map) {
    return Product(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      details: map['details'] ?? '',
      brand: map['brand'] ?? '',
      price: map['price'] ?? '',
      image2: map['image2'] ?? '',
      image3: map['image3'] ?? '',
      image4: map['image4'] ?? '',
      image5: map['image5'] ?? '',
      color: map['color'] ?? '',
      cat: map['cat'] ?? '',
      bestsell: map['bestsell'] ?? false,
    );
  }
}
