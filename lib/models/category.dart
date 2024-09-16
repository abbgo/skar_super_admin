import 'package:equatable/equatable.dart';
import 'package:skar_super_admin/models/dimension_group.dart';

class Category {
  final String id, nameTM, nameRU;
  final String? image, parentCategoryID, dimensionGroupID;
  final List<Category>? childCategories;
  final DimensionGroup? dimensionGroup;
  final Category? parentCategory;

  Category({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    this.image,
    this.parentCategoryID,
    this.childCategories,
    this.dimensionGroup,
    this.dimensionGroupID,
    this.parentCategory,
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
      dimensionGroupID: null,
      parentCategory: null,
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
      parentCategory: json['parent_category'] == null
          ? null
          : Category.fromJson(json['parent_category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_tm': nameTM,
      'name_ru': nameRU,
      'image': image,
      'parent_category_id': parentCategoryID,
      'dimension_group_id': dimensionGroupID,
    };
  }
}

class ResultCategory extends Equatable {
  final List<Category>? categories;
  final Category? category;
  final int? pageCount;
  final String? message;
  final String error;

  const ResultCategory({
    this.categories,
    this.category,
    this.pageCount,
    this.message,
    required this.error,
  });

  factory ResultCategory.defaultResult() {
    return const ResultCategory(
      categories: null,
      category: null,
      pageCount: null,
      message: null,
      error: '',
    );
  }

  @override
  List<Object?> get props => [categories, category, pageCount, message, error];
}
