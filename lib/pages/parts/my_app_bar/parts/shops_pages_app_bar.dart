import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/search_wainting_shops.dart';
import 'package:skar_super_admin/providers/api/shop.dart';

class ShopsPagesAppBar extends StatelessWidget {
  const ShopsPagesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SearchWaintingShops(),
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
