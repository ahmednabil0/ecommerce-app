class Category {
  String name;
  String image;
  Category({
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image': image});

    return result;
  }

  factory Category.fromMap(map) {
    return Category(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
