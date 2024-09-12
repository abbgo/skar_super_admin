import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/product.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';

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
        'limit': pageSize.toString(),
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
          return const ResultProduct(products: null, pageCount: 0, error: '');
        }

        var productsList = jsonData['products'] as List;
        return ResultProduct(
          products: productsList
              .map<Product>((propJson) => Product.fromJson(propJson))
              .toList(),
          pageCount: jsonData['page_count'],
          error: '',
        );
      }
      return const ResultProduct(
        products: null,
        pageCount: 0,
        error: 'auth error',
      );
    } catch (e) {
      rethrow;
    }
  }

  // update product created status ------------------------------------------------
  Future<ResultProduct> updateProductCreatedStatus({
    required String accessToken,
    required ShopCreatedStatus shop,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/products/admin/created-status');

    try {
      http.Response response = await http.put(
        uri,
        headers: tokenHeader(accessToken),
        body: json.encode(shop.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultProduct(message: '', error: '');
        }

        return ResultProduct(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultProduct(error: 'some error');
      }

      return const ResultProduct(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class ProductParams extends Equatable {
  final bool? isDeleted;
  final BuildContext? context;
  final List<String>? cratedStatuses;
  final ShopCreatedStatus? productCreatedStatus;

  const ProductParams({
    this.isDeleted,
    this.context,
    this.cratedStatuses,
    this.productCreatedStatus,
  });

  factory ProductParams.defaultProductParams() {
    return const ProductParams(
      isDeleted: null,
      context: null,
      cratedStatuses: [],
      productCreatedStatus: null,
    );
  }

  @override
  List<Object?> get props => [
        isDeleted,
        context,
        cratedStatuses,
        productCreatedStatus,
      ];
}
