import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/helpers/functions/validation.dart';
import 'package:skar_super_admin/helpers/methods/toasts.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/providers/pages/products.dart';
import 'package:skar_super_admin/services/api/product.dart';

final productApiProvider =
    Provider<ProductApiService>((ref) => ProductApiService());

var fetchProductsProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();
    try {
      bool isTM = ref.read(langProvider) == 'tr';
      String search = ref.watch(productSearchProvider);
      String accessToken = await ref.read(accessTokenProvider);
      ResultProduct resultShop =
          await ref.read(productApiProvider).fetchProducts(
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
      result = ResultProduct(error: e.toString());
    }

    return result;
  },
);

var updateProductCreatedStatusProvider =
    FutureProvider.autoDispose.family<ResultProduct, ProductParams>(
  (ref, arg) async {
    ResultProduct result = ResultProduct.defaultResult();

    try {
      String accessToken = await ref.read(accessTokenProvider);
      ResultProduct resultShop =
          await ref.read(productApiProvider).updateProductCreatedStatus(
                accessToken: accessToken,
                shop: arg.productCreatedStatus!,
              );

      await wrongToken(resultShop.error, ref, arg.context);

      if (resultShop.error == 'some error') {
        showToast('Käbir ýalňyşlyk ýüze çykdy !', true);
      }

      result = resultShop;
    } catch (e) {
      result = ResultProduct(error: e.toString());
    }

    return result;
  },
);
