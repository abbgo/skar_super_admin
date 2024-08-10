import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/validation.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';
import 'package:skar_super_admin/services/api/shop.dart';

final shopApiProvider = Provider<ShopApiService>((ref) => ShopApiService());

var fetchShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      bool isTM = ref.read(langProvider) == 'tr';
      String search = ref.watch(shopSearchProvider);
      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
            accessToken: accessToken,
            page: arg.page!,
            shopOwnerID: '',
            isDeleted: arg.isDeleted!,
            isShoppingCenter: false,
            search: search,
            lang: isTM ? 'tm' : 'ru',
          );

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.shops != null) {
        arg.isDeleted!
            ? ref.read(hasDeletedShopsProvider.notifier).state =
                resultShop.shops!.isNotEmpty
            : ref.read(hasShopsProvider.notifier).state =
                resultShop.shops!.isNotEmpty;
      }

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);
