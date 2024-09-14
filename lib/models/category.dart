import 'package:equatable/equatable.dart';
import 'package:skar_super_admin/models/dimension_group.dart';

class Category {
  final String id, nameTM, nameRU;
  final String? image;
  final String? parentCategoryID, dimensionGroupID;
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
    this.dimensionGroupID,
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

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name_tm': nameTM,
  //     'name_ru': nameRU,
  //     'latitude': latitude,
  //     'longitude': longitude,
  //     'address_tm': addressTM,
  //     'address_ru': addressRU,
  //     'phones': phones,
  //     'shop_owner_id': shopOwnerID,
  //     'has_shipping': hasShipping,
  //     'image': image,
  //     'parent_shop_id': parentShopID,
  //     'created_status': createdStatus,
  //     'at_home': atHome,
  //   };
  // }
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
