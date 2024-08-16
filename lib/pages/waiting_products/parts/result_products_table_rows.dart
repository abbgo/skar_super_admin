import 'package:flutter/widgets.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/result_table_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultProductsTableRows extends StatelessWidget {
  const ResultProductsTableRows({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Row(
      children: [
        ResultTableHeader(text: product.nameTM, isHeader: false),
        ResultTableHeader(text: product.nameRU, isHeader: false),
        ResultTableHeader(text: '${product.price} man', isHeader: false),
        ResultTableHeader(
          text: product.oldPrice != null ? '${product.oldPrice} man' : '-',
          isHeader: false,
        ),
        ResultTableHeader(
          text: product.brend != null ? product.brend!.name : '-',
          isHeader: false,
        ),
        ResultTableHeader(text: product.shop!.nameTM!, isHeader: false),
        ResultTableHeader(
          text: product.isVisible ? lang.yes : lang.no,
          isHeader: false,
        ),
        const ResultTableHeader(text: '', isHeader: false),
      ],
    );
  }
}
