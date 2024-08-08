import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/pages/login/parts/login_inputs.dart';
import 'package:skar_super_admin/styles/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: logoColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          width: screenProperties(context).width * .6,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.cover,
                width: screenProperties(context).width * .15,
              ),
              const SizedBox(width: 50),
              LoginInputs(),
            ],
          ),
        ),
      ),
    );
  }
}
