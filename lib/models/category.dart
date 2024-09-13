import 'package:equatable/equatable.dart';
import 'package:skar_super_admin/models/dimension_group.dart';

class Category {
  final String id, nameTM, nameRU;
  final String? image;
  final String? parentCategoryID;
  final List<Category>? childCategories;
  final DimensionGroup? dimensionGroup;

  Category({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    this.image,
    this.parentCategoryID,
    this.childCategories,
    required this.dimensionGroup,
  });

  factory Category.defaultCategory() {
    return Category(
      id: '',
      nameTM: '',
      nameRU: '',
      image: '',
      parentCategoryID: null,
      childCategories: null,
      dimensionGroup: null,
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
          ? null
          : List<Category>.from(
              json['child_categories'].map(
                (categoryJson) => Category.fromJson(categoryJson),
              ),
            ),
      dimensionGroup: json['dimension_group'] == null
          ? null
          : DimensionGroup.fromJson(json['dimension_group']),
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
