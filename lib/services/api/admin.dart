import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:http/http.dart' as http;
import 'package:skar_super_admin/models/admin.dart';

class AdminApiService {
  // login admin ---------------------------------------------------------------
  Future<ResultLoginAdmin> loginAdmin(
    String phoneNumber,
    String password,
  ) async {
    Uri uri = Uri.parse('$apiUrl/admins/login');
    Map<String, dynamic> data = {
      'phone_number': phoneNumber,
      'password': password,
    };

    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode(data),
      );
      dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        return ResultLoginAdmin.fromJson(jsonData);
      }
      return ResultLoginAdmin.defaultResponse();
    } catch (e) {
      rethrow;
    }
  }
}

class LoginAdminParams extends Equatable {
  final String phoneNumber;
  final String password;
  final BuildContext context;

  const LoginAdminParams({
    required this.phoneNumber,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [phoneNumber, password, context];
}
