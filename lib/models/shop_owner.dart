class ShopOwner {
  final String id, fullName, phoneNumber;

  ShopOwner({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
  });

  factory ShopOwner.defaultShopOwner() {
    return ShopOwner(id: '', fullName: '', phoneNumber: '');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'full_name': fullName,
      'phone_number': phoneNumber,
    };
  }

  factory ShopOwner.fromJson(Map<String, dynamic> json) {
    return ShopOwner(
      id: json['id'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
    );
  }
}
