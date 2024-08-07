import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/login/parts/login_image_and_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginImageAndText(),
            Text('Inputlar'),
          ],
        ),
      ),
    );
  }
}
