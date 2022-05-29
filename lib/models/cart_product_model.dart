class Cartproducts {
  String name;
  double price;
  int count = 1;
  String img;
  int? id;
  Cartproducts({
    required this.name,
    required this.price,
    required this.count,
    required this.img,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'count': count});
    result.addAll({'img': img});
    if (id != null) {
      result.addAll({'id': id});
    }

    return result;
  }

  factory Cartproducts.fromMap(Map<String, dynamic> map) {
    return Cartproducts(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      count: map['count']?.toInt() ?? 0,
      img: map['img'] ?? '',
      id: map['id']?.toInt(),
    );
  }
}
