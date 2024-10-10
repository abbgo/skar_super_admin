import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopChangeBrandStatusButton extends StatelessWidget {
  const ShopChangeBrandStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return CheckboxListTile(
      title: Text('${lang.isItAnOfficialStore} ?'),
      value: true,
      onChanged: (value) {},
    );

    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    //   onPressed: () async {
    //     // ShopParams params = ShopParams(
    //     //   context: context,
    //     //   shopCreatedStatus: ShopCreatedStatus(id: shopID, createdStatus: 2),
    //     // );
    //     // await ref.watch(updateShopCreatedStatusProvider(params).future);
    //     // showToast(lang.shopConfirmed, false);
    //     // ref.invalidate(fetchShopsProvider);
    //   },
    //   child: Text(
    //     '${lang.isItAnOfficialStore} ?',
    //     style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    //   ),
    // );
  }
}
