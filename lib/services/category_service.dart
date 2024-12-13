import 'dart:developer';

import '../helpers/http_api.dart';
import '../models/category_model/category_model.dart';

class CategoryService {
  static Future<List<CategoryModel>> getSuperCategories() async {
    List<CategoryModel> superCategories = [];
  try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'categories/superCategories/all',
      );
      for (var element in (res.responseData["categories"])) {
        superCategories.add(CategoryModel.fromJson(element));
      }
    } catch (e) {
      log('EXCEPTION: $e  getSuperCategoriesTAG');
    }
    return superCategories;
  }

  static Future<List<CategoryModel>> getSubCategoriesById(
    String categoryId,
  ) async {
    List<CategoryModel> subCategories = [];
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'categories/$categoryId/subCategories',
      );
      for (var element in (res.responseData["categories"])) {
        subCategories.add(CategoryModel.fromJson(element));
      }
    } catch (e) {
      log('EXCEPTION: $e  getSubCategoriesTAG');
    }
    return subCategories;
  }

  static Future<CategoryModel?> getCategoryById(String categoryId) async {
     CategoryModel? category;
log('--------------------------DEV LOG-------------1-------------');
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'categories/$categoryId',
      );

      category = CategoryModel.fromJson(res.responseData);
    } catch (e) {
      log('EXCEPTION: $e  getCategoryByIdTAG');
    }
    return category;
  }
}
