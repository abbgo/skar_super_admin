import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/category.dart';

class CategoryApiService {
  // fetch categroies with child --------------------------------------------
  Future<ResultCategory> fetchCategoriesWithChild(
    String accessToken,
    String search,
    int page,
    String lang,
    bool isDeleted,
  ) async {
    Uri uri = Uri.parse('$apiUrl/back/categories/with-child').replace(
      queryParameters: {
        'limit': '100',
        'page': '$page',
        'search': search,
        'lang': lang,
        'is_deleted': isDeleted.toString(),
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['categories'] == null) {
          return const ResultCategory(
            categories: null,
            pageCount: 0,
            error: '',
          );
        }

        var categoriesList = jsonData['categories'] as List;
        return ResultCategory(
          categories: categoriesList
              .map<Category>((propJson) => Category.fromJson(propJson))
              .toList(),
          pageCount: jsonData['page_count'],
          error: '',
        );
      }
      return const ResultCategory(categories: null, pageCount: 0, error: '');
    } catch (e) {
      rethrow;
    }
  }

// fetch category -------------------------------------------------------
  Future<ResultCategory> fetchCategory({
    required String accessToken,
    required String categoryID,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/categories/$categoryID');

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['category'] == null) {
          return ResultCategory(
            category: Category.defaultCategory(),
            error: '',
          );
        }

        return ResultCategory(
          category: Category.fromJson(jsonData['category']),
          error: '',
        );
      }
      return ResultCategory(
        category: Category.defaultCategory(),
        error: 'auth error',
      );
    } catch (e) {
      rethrow;
    }
  }

// fetch categroies --------------------------------------------
  static Future<ResultCategory> fetchCategories(
    String accessToken,
    String search,
    int page,
    String lang,
  ) async {
    Uri uri = Uri.parse('$apiUrl/back/categories').replace(
      queryParameters: {
        'limit': '100',
        'page': '$page',
        'search': search,
        'lang': lang
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['categories'] == null) {
          return const ResultCategory(
            categories: null,
            pageCount: 0,
            error: '',
          );
        }

        var categoriesList = jsonData['categories'] as List;
        return ResultCategory(
          categories: categoriesList
              .map<Category>((propJson) => Category.fromJson(propJson))
              .toList(),
          pageCount: jsonData['page_count'],
          error: '',
        );
      }
      return const ResultCategory(categories: null, pageCount: 0, error: '');
    } catch (e) {
      rethrow;
    }
  }

// create category -------------------------------------------------------
  Future<ResultCategory> createCategory({
    required String accessToken,
    required Category category,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/categories');

    try {
      http.Response response = await http.post(
        uri,
        headers: tokenHeader(accessToken),
        body: json.encode(category.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultCategory(message: '', error: '');
        }

        return ResultCategory(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultCategory(error: 'some error');
      }

      return const ResultCategory(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

// update category -------------------------------------------------------
  Future<ResultCategory> updateCategory({
    required String accessToken,
    required Category category,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/categories');

    try {
      http.Response response = await http.put(
        uri,
        headers: tokenHeader(accessToken),
        body: json.encode(category.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultCategory(message: '', error: '');
        }

        return ResultCategory(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultCategory(error: 'some error');
      }

      return const ResultCategory(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

// check category for delete -------------------------------------------------------
  Future<ResultCategory> checkCategoryForDelete({
    required String accessToken,
    required String categoryID,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/categories/$categoryID/check-for-delete');

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        return ResultCategory(
          forDeletion: jsonData['for_deletion'] as bool,
          error: '',
        );
      }
      return const ResultCategory(forDeletion: false, error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }

// delete category -------------------------------------------------------
  Future<ResultCategory> deleteCategory({
    required String accessToken,
    required String categoryID,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/categories/$categoryID');

    try {
      http.Response response = await http.delete(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultCategory(message: '', error: '');
        }

        return ResultCategory(message: jsonData['message'], error: '');
      }

      if (response.statusCode == 400) {
        return const ResultCategory(error: 'some error');
      }

      return const ResultCategory(message: '', error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}

class CategoryParams extends Equatable {
  final BuildContext? context;
  final Category? category;
  final String? categoryID;

  const CategoryParams({this.context, this.category, this.categoryID});

  factory CategoryParams.defaultValue() {
    return const CategoryParams(
      context: null,
      category: null,
      categoryID: null,
    );
  }

  @override
  List<Object?> get props => [context, category, categoryID];
}
