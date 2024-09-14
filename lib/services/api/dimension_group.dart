class DimensionGroupApiService {
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
}
