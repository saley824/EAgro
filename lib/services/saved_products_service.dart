import 'dart:developer';

import '../helpers/http_api.dart';
import '../models/saved_products_model/saved_product_model.dart';

class SavedProductsService {
  static Future<List<SavedProductModel>> getSavedProducts(
      final String userUuid) async {
    List<SavedProductModel> savedProducts = [];
    try {
      final res = await HttpAPI.makeAPIcall(
          ApiMethod.get, 'saved_products/$userUuid',
          authTokenRequired: true);

      for (var element in (res.responseData["savedProducts"])) {
        savedProducts.add(SavedProductModel.fromJson(element));
      }
    } catch (e) {
      log('EXCEPTION: $e  getSavedProductsTAG');
    }
    return savedProducts;
  }

  static Future<bool> deleteSavedProductById({
    required final String productUuid,
    required final String userUuid,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.delete,
        'saved_products/$userUuid/$productUuid',
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  deleteSavedProductByIdTAG');
    }
    return success;
  }

  static Future<bool> saveProduct({
    required final String productUuid,
    required final String userUuid,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'saved_products/',
        body: {
          "productId": productUuid,
          "userId": userUuid,
        },
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  saveProductTAG');
    }
    return success;
  }

  static Future<bool> checkIfSaved({
    required final String productUuid,
    required final String userUuid,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'saved_products/checkIsSaved/$userUuid/$productUuid',
      );

      success = res.responseData["isSaved"];
    } catch (e) {
      log('EXCEPTION: $e  checkIfSavedTAG');
    }
    return success;
  }

  // static Future<List<ProductListModel>> DE(
  //     final String userUuid) async {
  //   List<ProductListModel> products = [];
  //   try {
  //     final res = await HttpAPI.makeAPIcall(
  //       ApiMethod.get,
  //       'saved_products/$userUuid',
  //     );

  //     for (var element in (res.responseData["savedProducts"])) {
  //       products.add(ProductListModel.fromJson(element));
  //     }
  //   } catch (e) {
  //     log('EXCEPTION: $e  getSavedProductsTAG');
  //   }
  //   return products;
  // }
}
