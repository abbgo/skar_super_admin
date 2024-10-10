class ShopBrandStatus {
  final String id;
  final bool brandStatus;

  ShopBrandStatus({this.id = '', this.brandStatus = false});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'brand_status': brandStatus};
  }
}
