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

class ResponseLoginAdmin {
  final Admin admin;
  final String accessToken;

  const ResponseLoginAdmin({
    required this.admin,
    required this.accessToken,
  });

  factory ResponseLoginAdmin.defaultResponse() {
    return ResponseLoginAdmin(
      admin: Admin.defaultAdmin(),
      accessToken: '',
    );
  }

  factory ResponseLoginAdmin.fromJson(Map<String, dynamic> json) {
    return ResponseLoginAdmin(
      admin: Admin.fromJson(json['admin']),
      accessToken: json['access_token'],
    );
  }
}
