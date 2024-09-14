import 'dart:convert';

import 'package:skar_super_admin/helpers/static_data.dart';
import 'package:skar_super_admin/models/dimension_group.dart';
import 'package:http/http.dart' as http;

class DimensionGroupApiService {
  // fetch dimensionGroups --------------------------------------------
  static Future<ResultDimensionGroup> fetchDimensionGroups(
    String accessToken,
    int page,
  ) async {
    Uri uri =
        Uri.parse('$apiUrl/back/dimension-groups/with-dimensions').replace(
      queryParameters: {'limit': '100', 'page': '$page'},
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['dimension_groups'] == null) {
          return const ResultDimensionGroup(dimensionGroups: null, error: '');
        }

        var categoriesList = jsonData['dimension_groups'] as List;
        return ResultDimensionGroup(
          dimensionGroups: categoriesList
              .map<DimensionGroup>(
                  (propJson) => DimensionGroup.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultDimensionGroup(dimensionGroups: null, error: '');
    } catch (e) {
      rethrow;
    }
  }
}
