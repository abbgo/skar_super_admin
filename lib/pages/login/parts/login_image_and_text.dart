import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';

class LoginImageAndText extends StatelessWidget {
  const LoginImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/logo.jpg",
            fit: BoxFit.cover,
            width: screenProperties(context).width * .3,
          ),
          Text(
            '${lang.welcome} !',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          ),
        ],
      ),
    );
  }
}
