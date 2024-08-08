import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/services/api/admin.dart';

final adminApiServiceProvider =
    Provider<AdminApiService>((ref) => AdminApiService());

var loginAdminProvider = FutureProvider.autoDispose
    .family<ResultLoginAdmin, LoginShopOwnerParams>((ref, arg) async {
  ResultLoginAdmin result = ResultLoginAdmin.defaultResult();

  try {
    bool hasInternert =
        await ref.read(checkInternetConnProvider(arg.context).future);

    if (hasInternert) {
      ResultLoginAdmin responseLoginShopOwner = await ref
          .read(shopOwnerApiServiceProvider)
          .loginShopOwner(arg.phoneNumber, arg.password);

      result = ResultLoginAdmin(
          error: '', responseLoginShopOwner: responseLoginShopOwner);
    }
  } catch (e) {
    result = ResultLoginAdmin(error: e.toString());
  }

  return result;
});
