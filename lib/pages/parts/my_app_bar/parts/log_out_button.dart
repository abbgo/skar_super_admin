import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/styles/colors.dart';

class LogOutButton extends ConsumerWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(accessTokenProvider.notifier).update('');
        goToHome(context);
      },
      icon: Icon(Icons.logout, color: elevatedButtonColor),
    );
  }
}
