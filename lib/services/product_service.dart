import 'dart:developer';

import '/models/products_model/product_filter_model.dart';
import '/models/products_model/product_model.dart';
import '/screens/products_list_screen/products_list_models/sort_model.dart';
import '../helpers/http_api.dart';
import '../models/products_model/products_list_response_model.dart';

makeFilterString(
  ProductFilterModel? productFilterModel,
) {
  if (productFilterModel == null) return "";
  String filterString = "";

  if (productFilterModel.superCategory != null) {
    filterString += "&superCategoryId=${productFilterModel.superCategory!.id}";
  }
  if (productFilterModel.category != null) {
    filterString += "&categoryId=${productFilterModel.category!.id}";
  }
  if (productFilterModel.toPrice != null) {
    filterString += "&price[lte]=${productFilterModel.toPrice}";
  }
  if (productFilterModel.fromPrice != null) {
    filterString += "&price[gte]=${productFilterModel.fromPrice}";
  }
  filterString += "&hasDiscount=${productFilterModel.hasDiscount}";
  if (productFilterModel.searchTerm != null) {
    filterString += "&searchTerm=${productFilterModel.searchTerm}";
  }

  return filterString;
}

class ProductService {
  static Future<ProductsListResponseModel?> getProducts({
    required ProductFilterModel? productFilterModel,
    required SortModel sortModel,
    String searchTerm = "",
    int page = 1,
  }) async {
    String filterString = makeFilterString(productFilterModel);
    ProductsListResponseModel? productsResponse;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'products/?page=$page&perPage=5&searchTerm=$searchTerm&sortBy=${sortModel.sortBy}&orderBy=${sortModel.orderBy}$filterString',
      );
      productsResponse = ProductsListResponseModel.fromJson(res.responseData);
    } catch (e) {
      log('EXCEPTION: $e  getProductsTAG');
    }
    return productsResponse;
  }

  static Future<ProductModel?> getProductById(String id) async {
    ProductModel? product;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'products/product/$id',
      );

      product = ProductModel.fromJson(res.responseData["product"]);
    } catch (e) {
      log('EXCEPTION: $e  getProductByIdTAG');
    }
    return product;
  }

  static Future<bool> deleteProductById(final String productUuid) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.delete,
        'products/$productUuid',
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  deleteProductByIdTAG');
    }
    return success;
  }
}
