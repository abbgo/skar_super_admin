import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String accessToken = ref.watch(accessTokenProvider);
    print('-------------- accessToken: $accessToken');

    return accessToken.isEmpty
        ? const Center(child: Text('Login Page'))
        : const Center(child: Text('Dashboard'));
  }
}
