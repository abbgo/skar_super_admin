class Admin {
  final String fullName, phoneNumber;
  final bool isSuperAdmin;

  Admin({
    required this.fullName,
    required this.phoneNumber,
    required this.isSuperAdmin,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      isSuperAdmin: json['is_super_admin'],
    );
  }

  factory Admin.defaultAdmin() {
    return Admin(
      fullName: '',
      phoneNumber: '',
      isSuperAdmin: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'phone_number': phoneNumber,
      'is_super_admin': isSuperAdmin,
    };
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
