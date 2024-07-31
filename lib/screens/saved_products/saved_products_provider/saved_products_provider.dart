import 'package:flutter/material.dart';
import 'package:msan/models/products_model/product_model.dart';
import 'package:msan/models/saved_products_model/saved_product_model.dart';
import 'package:msan/services/saved_products_service.dart';

import '../../../models/products_model/product_list_model.dart';
import '../../../services/product_service.dart';

class SavedProductsProvider extends ChangeNotifier {
  List<SavedProductModel> savedProductsId = [];
  List<ProductListModel> savedProducts = [];
  Future<void> getSavedProducts(final String userUuid) async {
    savedProductsId = await SavedProductsService.getSavedProducts(userUuid);
    await mapSavedProducts();
  }

  mapSavedProducts() async {
    for (var s in savedProductsId) {
      final product = await getProduct(s.productId);
      savedProducts.add(ProductListModel(
        id: product!.id,
        categoryId: product.categoryId,
        name: product.name,
        price: product.price,
        createdAt: product.createdAt,
        unit: product.unit!,
        countReview: product.countReview,
        avgReview: product.avgReview,
        image: product.image,
        discountedPrice: product.discountedPrice,
        productDiscount: product.productDiscount,
        // quantity: product.quantity
      ));
    }
  }

  Future<ProductModel?> getProduct(String productId) async {
    return await ProductService.getProductById(productId);
  }
}
