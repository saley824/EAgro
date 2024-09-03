import 'package:flutter/material.dart';
import '/services/cart_service.dart';

import '../../../services/saved_products_service.dart';
import '/models/products_model/product_model.dart';
import '/services/product_service.dart';
import '/services/review_service.dart';

class ProductProvider extends ChangeNotifier {
  final String id;
  final String userId;
  ProductModel? product;
  int? rating;
  int? currentRating;

  ProductProvider(this.id, this.userId);

  setCurrentRating(value) {
    currentRating = value;
    enableButton();
  }

  bool isButtonEnabled = false;

  enableButton() {
    isButtonEnabled = currentRating != null;
    notifyListeners();
  }

  getData() async {
    await getProduct();
    await checkIsUserRatedProduct();
    await checkIfSaved();
  }

  getProduct() async {
    product = await ProductService.getProductById(id);
  }

  checkIsUserRatedProduct() async {
    final res =
        await ReviewService.checkIfUserRatedProduct(userId, product!.id);
    rating = res?.rating;
  }

  makeReview() async {
    bool success = false;

    success = await ReviewService.makeReview(
        productUuid: product!.id, userUuid: userId, rating: currentRating!);

    if (success) {
      isButtonEnabled = false;
    }
    notifyListeners();

    return success;
  }

  //---------------------------------SAVED PRODUCTS---------------------------------

  bool isProductSaved = false;
  Future<void> checkIfSaved() async {
    isProductSaved = await SavedProductsService.checkIfSaved(
        productUuid: product!.id, userUuid: userId);
  }

  Future<bool> deleteSavedProductById() async {
    bool success = false;
    success = await SavedProductsService.deleteSavedProductById(
        productUuid: product!.id, userUuid: userId);
    notifyListeners();
    return success;
  }

  Future<bool> saveProduct() async {
    bool success = false;
    success = await SavedProductsService.saveProduct(
        productUuid: product!.id, userUuid: userId);
    notifyListeners();
    return success;
  }

  //---------------------------------Cart handler---------------------------------

  Future<bool> addToCart() async {
    bool success =
        await CartService.addToCart(productUuid: product!.id, userUuid: userId);

    return success;
  }

  Future<bool> removeFromCart() async {
    bool success = await CartService.removeCartItem(
        productUuid: product!.id, userUuid: userId);

    return success;
  }

  void refresh() {
    notifyListeners();
  }
}
