import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/services/api/admin.dart';

final adminApiServiceProvider =
    Provider<AdminApiService>((ref) => AdminApiService());
