import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
