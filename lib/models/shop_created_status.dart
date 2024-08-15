class ShopCreatedStatus {
  final String id;
  final int createdStatus;
  final String? rejectedReason;

  ShopCreatedStatus({
    this.id = '',
    this.createdStatus = 0,
    this.rejectedReason,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'created_status': createdStatus,
      'rejected_reason': rejectedReason,
    };
  }
}
