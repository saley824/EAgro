import 'dart:developer';

import '../helpers/http_api.dart';
import '/models/products_model/product_filter_model.dart';
import '/models/products_model/product_list_model.dart';
import '/models/products_model/product_model.dart';
import '/screens/products_list_screen/products_list_models/sort_model.dart';

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
  static Future<List<ProductListModel>> getProducts(
      ProductFilterModel? productFilterModel, SortModel sortModel) async {
    String filterString = makeFilterString(productFilterModel);
    List<ProductListModel> products = [];
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'products/?page=1&perPage=20&sortBy=${sortModel.sortBy}&orderBy=${sortModel.orderBy}$filterString',
      );

      for (var element in (res.responseData["products"])) {
        products.add(ProductListModel.fromJson(element));
      }
    } catch (e) {
      log('EXCEPTION: $e  getProductsTAG');
    }
    return products;
  }

  static Future<ProductModel?> getProductById() async {
    ProductModel? product;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'products/product/',
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
        'products/product/$productUuid',
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  deleteProductByIdTAG');
    }
    return success;
  }
}
