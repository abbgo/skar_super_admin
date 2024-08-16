import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/product.dart';

class ProductApiService {
  // fetch products -------------------------------------------------------
  Future<ResultProduct> fetchProducts({
    required String accessToken,
    required int page,
    required bool isDeleted,
    required String search,
    required String lang,
    required List<String> cratedStatuses,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/products/admin').replace(
      queryParameters: {
        'limit': '50',
        'page': '$page',
        'is_deleted': '$isDeleted',
        'search': search,
        'lang': lang,
        'crated_statuses': cratedStatuses,
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['products'] == null) {
          return const ResultProduct(products: null, error: '');
        }

        var productsList = jsonData['products'] as List;
        return ResultProduct(
          products: productsList
              .map<Product>((propJson) => Product.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultProduct(products: [], error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class ProductParams extends Equatable {
  final bool? isDeleted;
  final int? page;
  final BuildContext? context;
  final List<String>? cratedStatuses;

  const ProductParams({
    this.isDeleted,
    this.page,
    this.context,
    this.cratedStatuses,
  });

  factory ProductParams.defaultProductParams() {
    return const ProductParams(
      isDeleted: null,
      page: null,
      context: null,
      cratedStatuses: [],
    );
  }

  @override
  List<Object?> get props => [
        isDeleted,
        page,
        context,
        cratedStatuses,
      ];
}
