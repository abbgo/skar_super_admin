import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/services/api/product.dart';

final productApiProvider =
    Provider<ProductApiService>((ref) => ProductApiService());
