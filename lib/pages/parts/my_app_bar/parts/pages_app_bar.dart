import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/pages_app_bar_search.dart';
import 'package:skar_super_admin/providers/api/shop.dart';

class PagesAppBar extends StatelessWidget {
  const PagesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const PagesAppBarSearch(),
        const SizedBox(width: 20),
        Consumer(
          builder: (context, ref, child) => ElevatedButton(
            onPressed: () => ref.invalidate(fetchShopsProvider),
            child: const Icon(Icons.autorenew),
          ),
        ),
      ],
    );
  }
}
