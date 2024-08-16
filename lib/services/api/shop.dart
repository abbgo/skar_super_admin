import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';
import 'package:skar_super_admin/models/shop_created_status.dart';

class ShopApiService {
  // fetch shops -------------------------------------------------------
  Future<ResultShop> fetchShops({
    required String accessToken,
    required int page,
    required bool isDeleted,
    required String search,
    required String lang,
    required List<String> cratedStatuses,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/shops/admin').replace(
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
        if (jsonData['shops'] == null) {
          return const ResultShop(shops: null, error: '');
        }

        var shopsList = jsonData['shops'] as List;
        return ResultShop(
          shops: shopsList
              .map<Shop>((propJson) => Shop.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultShop(shops: [], error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

  // update shop created status ------------------------------------------------
  Future<ResultShop> updateShopCreatedStatus({
    required String accessToken,
    required ShopCreatedStatus shop,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/shops/admin/created-status');

    try {
      http.Response response = await http.put(
        uri,
        headers: tokenHeader(accessToken),
        body: json.encode(shop.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultShop(message: '', error: '');
        }

        return ResultShop(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultShop(error: 'some error');
      }

      return const ResultShop(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class ShopParams extends Equatable {
  final bool? isDeleted;
  final int? page;
  final BuildContext? context;
  final List<String>? cratedStatuses;
  final ShopCreatedStatus? shopCreatedStatus;

  const ShopParams({
    this.isDeleted,
    this.page,
    this.context,
    this.cratedStatuses,
    this.shopCreatedStatus,
  });

  factory ShopParams.defaultShopParams() {
    return const ShopParams(
      isDeleted: null,
      page: null,
      context: null,
      cratedStatuses: [],
      shopCreatedStatus: null,
    );
  }

  @override
  List<Object?> get props =>
      [isDeleted, page, context, cratedStatuses, shopCreatedStatus];
}
