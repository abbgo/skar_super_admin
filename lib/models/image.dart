class ProductColorImage {
  final String image;
  final int orderNumber;

  const ProductColorImage({required this.image, required this.orderNumber});

  factory ProductColorImage.fromJson(Map<String, dynamic> json) {
    return ProductColorImage(
      image: json['image'],
      orderNumber: json['order_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'order_number': orderNumber};
  }
}
