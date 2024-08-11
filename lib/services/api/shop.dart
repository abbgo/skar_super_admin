import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/shop.dart';

class ShopApiService {
  // fetch shops -------------------------------------------------------
  Future<ResultShop> fetchShops({
    required String accessToken,
    required int page,
    required String shopOwnerID,
    required bool isDeleted,
    required bool isShoppingCenter,
    required String search,
    required String lang,
    required List<String> cratedStatuses,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/shops').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'shop_owner_id': shopOwnerID,
        'is_deleted': '$isDeleted',
        'is_shopping_center': '$isShoppingCenter',
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
}

class ShopParams extends Equatable {
  final bool? isDeleted;
  final int? page;
  final BuildContext? context;
  final Shop? shop;
  final String? shopID;
  final List<String> cratedStatuses;

  const ShopParams({
    this.isDeleted,
    this.page,
    this.context,
    this.shop,
    this.shopID,
    required this.cratedStatuses,
  });

  factory ShopParams.defaultShopParams() {
    return const ShopParams(
      isDeleted: null,
      page: null,
      context: null,
      shop: null,
      shopID: null,
      cratedStatuses: [],
    );
  }

  @override
  List<Object?> get props =>
      [isDeleted, page, context, shop, shopID, cratedStatuses];
}
