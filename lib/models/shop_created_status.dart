class ShopCreatedStatus {
  final String id;
  final int createdStatus;

  ShopCreatedStatus({
    this.id = '',
    this.createdStatus = 0,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'created_status': createdStatus,
    };
  }
}
