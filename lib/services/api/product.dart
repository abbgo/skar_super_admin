import 'package:http/http.dart' as http;

class ProductApiService {
  // fetch shops -------------------------------------------------------
  Future<ResultShop> fetchProducts({
    required String accessToken,
    required int page,
    required bool isDeleted,
    required String search,
    required String lang,
    required List<String> cratedStatuses,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/shops/admin').replace(
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
