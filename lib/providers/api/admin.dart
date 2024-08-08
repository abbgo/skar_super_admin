import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/admin.dart';
import 'package:skar_super_admin/services/api/admin.dart';

final adminApiServiceProvider =
    Provider<AdminApiService>((ref) => AdminApiService());

var loginAdminProvider = FutureProvider.autoDispose
    .family<ResultLoginAdmin, LoginAdminParams>((ref, arg) async {
  ResultLoginAdmin result = ResultLoginAdmin.defaultResult();

  try {
    ResponseLoginAdmin responseLoginAdmin = await ref
        .read(adminApiServiceProvider)
        .loginAdmin(arg.phoneNumber, arg.password);

    result =
        ResultLoginAdmin(error: '', responseLoginAdmin: responseLoginAdmin);
  } catch (e) {
    result = ResultLoginAdmin(error: e.toString());
  }

  return result;
});
