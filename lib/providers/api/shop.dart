import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/validation.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/shopping_centers.dart';
import 'package:skar_super_admin/providers/pages/shops.dart';
import 'package:skar_super_admin/services/api/shop.dart';

final shopApiProvider = Provider<ShopApiService>((ref) => ShopApiService());

var fetchShopsProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      int shopPage = await ref.watch(shopPageProvider);
      String search = await ref.watch(shopSearchProvider);
      String accessToken = await ref.read(accessTokenProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
            accessToken: accessToken,
            page: shopPage,
            isDeleted: arg.isDeleted!,
            isShoppingCenter: false,
            search: search,
            lang: isTM ? 'tm' : 'ru',
            cratedStatuses: arg.cratedStatuses!,
          );

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.pageCount == shopPage || resultShop.shops == null) {
        ref.read(activeShopNextButtonPageProvider.notifier).state = false;
      } else {
        ref.read(activeShopNextButtonPageProvider.notifier).state = true;
      }

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }

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

var fetchShoppingCentersProvider =
    FutureProvider.autoDispose.family<ResultShop, ShopParams>(
  (ref, arg) async {
    ResultShop result = ResultShop.defaultResult();
    try {
      String search = await ref.watch(shoppingCenterSearchProvider);
      int page = await ref.watch(shoppingCenterPageProvider);
      bool isTM = ref.read(langProvider) == 'tr';

      String accessToken = await ref.read(accessTokenProvider);
      ResultShop resultShop = await ref.read(shopApiProvider).fetchShops(
        accessToken: accessToken,
        page: page,
        isDeleted: arg.isDeleted!,
        isShoppingCenter: true,
        search: search,
        lang: isTM ? 'tm' : 'ru',
        cratedStatuses: [],
      );

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.pageCount == page || resultShop.shops == null) {
        ref.read(shoppingCenterNextButtonPageProvider.notifier).state = false;
      } else {
        ref.read(shoppingCenterNextButtonPageProvider.notifier).state = true;
      }

      result = resultShop;
    } catch (e) {
      result = ResultShop(error: e.toString());
    }
    return result;
  },
);
