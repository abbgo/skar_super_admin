class ProductColor {
  final String name;
  final List<String> dimensions;
  final List<String> images;

  const ProductColor(
      {required this.name, required this.dimensions, required this.images});

  factory ProductColor.defaultProductColor() {
    return const ProductColor(name: '', dimensions: [], images: []);
  }

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      name: json['name'],
      dimensions: json['dimensions'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'images': images, 'dimensions': dimensions};
  }
}
