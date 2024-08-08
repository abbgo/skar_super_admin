class Admin {
  final String id;
  final String fullName;
  final String phoneNumber;

  Admin({required this.id, required this.fullName, required this.phoneNumber});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
    );
  }

  factory Admin.defaultAdmin() {
    return Admin(id: '', fullName: '', phoneNumber: '');
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'full_name': fullName, 'phone_number': phoneNumber};
  }
}

class ResultLoginAdmin {
  final Admin admin;
  final String accessToken;

  const ResultLoginAdmin({
    required this.admin,
    required this.accessToken,
  });

  factory ResultLoginAdmin.defaultResponse() {
    return ResultLoginAdmin(
      admin: Admin.defaultAdmin(),
      accessToken: '',
    );
  }

  factory ResultLoginAdmin.fromJson(Map<String, dynamic> json) {
    return ResultLoginAdmin(
      admin: Admin.fromJson(json['admin']),
      accessToken: json['access_token'],
    );
  }
}
