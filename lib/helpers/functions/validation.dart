import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

Future<void> wrongToken(
  String error,
  dynamic ref,
  BuildContext? context,
) async {
  if (error == 'auth error') {
    await ref.read(accessTokenProvider.notifier).update('');
    if (context != null && context.mounted) {
      goToHome(context);
    }
  }
}
