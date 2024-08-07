import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/login/parts/login_image_and_text.dart';
import 'package:skar_super_admin/pages/login/parts/login_inputs.dart';
import 'package:skar_super_admin/styles/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          margin: const EdgeInsets.symmetric(horizontal: 300),
          decoration: BoxDecoration(
            color: logoColor,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginImageAndText(),
              LoginInputs(),
            ],
          ),
        ),
      ),
    );
  }
}
