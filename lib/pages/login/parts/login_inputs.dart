import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/pages/login/parts/input_password.dart';
import 'package:skar_super_admin/pages/login/parts/input_phone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginInputs extends StatefulWidget {
  const LoginInputs({super.key});

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  void dispose() {
    phoneNumberCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${lang.welcome} !',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
        ),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          child: SizedBox(
            width: screenProperties(context).width * .15,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputPhone(ctrl: phoneNumberCtrl),
                InputPassword(ctrl: passwordCtrl),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
