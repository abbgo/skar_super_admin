import 'package:equatable/equatable.dart';

class Category {
  final String id, nameTM, nameRU;
  final String? image;
  final String? parentCategoryID;
  final List<Category>? childCategories;

  Category({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    this.image,
    this.parentCategoryID,
    this.childCategories,
  });

  factory Category.defaultCategory() {
    return Category(
      id: '',
      nameTM: '',
      nameRU: '',
      image: '',
      parentCategoryID: null,
      childCategories: null,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      image: json['image'] ?? '',
      parentCategoryID: json['parent_category_id'] ?? '',
      childCategories: json['child_categories'] == null
          ? []
          : List<Category>.from(
              json['child_categories'].map(
                (categoryJson) => Category.fromJson(categoryJson),
              ),
            ),
    );
  }
}

class ResultCategory extends Equatable {
  final List<Category>? categories;
  final int? pageCount;
  final String error;

  const ResultCategory({this.categories, this.pageCount, required this.error});

  factory ResultCategory.defaultResult() {
    return const ResultCategory(categories: null, pageCount: null, error: '');
  }

  @override
  List<Object?> get props => [categories, pageCount, error];
}
