import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/validation.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';
import 'package:skar_super_admin/services/api/shop.dart';

final shopApiProvider = Provider<ShopApiService>((ref) => ShopApiService());

var fetchShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ref.read(loadShopsProvider.notifier).state = true;
    ResultShop result = ResultShop.defaultResult();
    try {
      bool isTM = ref.read(langProvider) == 'tr';
      String search = ref.watch(shopSearchProvider);
      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
            accessToken: accessToken,
            page: arg.page!,
            isDeleted: arg.isDeleted!,
            search: search,
            lang: isTM ? 'tm' : 'ru',
            cratedStatuses: arg.cratedStatuses!,
          );

      await wrongToken(resultShop.error, ref, arg.context);

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    ref.read(loadShopsProvider.notifier).state = false;
    return result;
  },
);

var updateShopCreatedStatusProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop =
          await ref.read(shopApiProvider).updateShopCreatedStatus(
                accessToken: accessToken,
                shop: arg.shopCreatedStatus!,
              );

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.error == 'some error') {
        showToast('Käbir ýalňyşlyk ýüze çykdy !', true);
      }

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

    return result;
  },
);
