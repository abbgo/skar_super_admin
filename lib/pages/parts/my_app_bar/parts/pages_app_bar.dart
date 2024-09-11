import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/pagination_buttons.dart';
import 'package:skar_super_admin/pages/parts/pages_app_bar_search.dart';

class PagesAppBar extends StatelessWidget {
  const PagesAppBar(
      {super.key, required this.searchProvider, required this.fetchProvider});

  final StateProvider<String> searchProvider;
  final AutoDisposeFutureProviderFamily<dynamic, dynamic> fetchProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PagesAppBarSearch(searchProvider: searchProvider),
        const SizedBox(width: 20),
        Consumer(
          builder: (context, ref, child) => ElevatedButton(
            onPressed: () => ref.invalidate(fetchProvider),
            child: const Icon(Icons.autorenew),
          ),
        ),
        const SizedBox(width: 10),
        const PaginationButtons(),
      ],
    );
  }
}
