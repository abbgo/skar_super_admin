import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/pages/waiting_products/parts/result_table_color_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';

class ResultProductsTableRows extends ConsumerWidget {
  const ResultProductsTableRows(
      {super.key, required this.product, required this.cratedStatus});

  final Product product;
  final int cratedStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String categories = '';
    var lang = AppLocalizations.of(context)!;
    bool isTM = ref.read(langProvider) == 'tr';

    for (var category in product.categories!) {
      categories += ' , ${isTM ? category.nameTM : category.nameRU}';
    }

    return Row(
      children: [
        // ResultTableHeader(text: product.nameTM, isHeader: false),
        // ResultTableHeader(text: product.nameRU, isHeader: false),
        // ResultTableHeader(text: '${product.price} man', isHeader: false),
        // ResultTableHeader(
        //   text: product.oldPrice != null ? '${product.oldPrice} man' : '-',
        //   isHeader: false,
        // ),
        // ResultTableHeader(
        //   text: product.brend != null ? product.brend!.name : '-',
        //   isHeader: false,
        // ),
        // ResultTableHeader(
        //   text: isTM ? product.shop!.nameTM! : product.shop!.nameRU!,
        //   isHeader: false,
        // ),
        // ResultTableHeader(
        //   text: product.isVisible ? lang.yes : lang.no,
        //   isHeader: false,
        // ),
        // ResultTableHeader(text: categories, isHeader: false),
        ResultTableColorRow(productColors: product.productColors!),
        // cratedStatus == CreatedStatuses.wait
        //     ? ProductsTableButtons(productID: product.id)
        //     : const ResultTableHeader(text: '', isHeader: false),
      ],
    );
  }
}
