import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/admin.dart';
import 'package:skar_super_admin/providers/api/admin.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/login.dart';
import 'package:skar_super_admin/services/api/admin.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.phoneNumberCtrl,
    required this.passwordCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneNumberCtrl;
  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool buttonPress = ref.watch(buttonPressProvider);

    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState?.validate() == true) {
            ref.read(buttonPressProvider.notifier).state = true;

            LoginAdminParams params = LoginAdminParams(
              phoneNumber: '+993${phoneNumberCtrl.text}',
              password: passwordCtrl.text,
              context: context,
            );

            ResultLoginAdmin result =
                await ref.read(loginAdminProvider(params).future);

            if (result.error != '') {
              if (context.mounted) {
                showErrToast(
                  context,
                  lang.someErrorOccurred,
                );
              }
              ref.read(buttonPressProvider.notifier).state = false;
              return;
            }

            if (result.responseLoginAdmin != null) {
              if (result.responseLoginAdmin!.accessToken == '') {
                if (context.mounted) showErrToast(context, lang.userNotFound);
                ref.read(buttonPressProvider.notifier).state = false;
                return;
              }

              ref.read(buttonPressProvider.notifier).state = false;

              await ref
                  .read(accessTokenProvider.notifier)
                  .update(result.responseLoginAdmin!.accessToken);
            }
          }
        },
        child: buttonPress
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Text(lang.login),
      ),
    );
  }
}
