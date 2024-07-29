import 'dart:developer';

import '/models/cart_model/cart_model.dart';

import '../helpers/http_api.dart';

class CartService {
  static Future<CartModel?> getCart(
    final String userUuid,
  ) async {
    // String filterString = makeFilterString(productFilterModel);
    late CartModel cartModel;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'cart/$userUuid',
      );

      cartModel = CartModel.fromJson(res.responseData);
    } catch (e) {
      log('EXCEPTION: $e  getCartTAG');
    }
    return cartModel;
  }

  static Future<bool> addToCart({
    required final String productUuid,
    required final String userUuid,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'cart/',
        body: {
          "productId": productUuid,
          "userId": userUuid,
        },
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  addToCartTAG');
    }
    return success;
  }

  static Future<bool> increment({
    required final String productUuid,
    required final String userUuid,
    required final String isIncrement,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.put,
        'cart/increment?isIncrement=$isIncrement',
        body: {
          "productId": productUuid,
          "userId": userUuid,
        },
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  incrementTAG');
    }
    return success;
  }

  static Future<bool> removeCartItem({
    required final String productUuid,
    required final String userUuid,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.delete,
        'cart/$userUuid/$productUuid',
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  removeCartItemTAG');
    }
    return success;
  }
}
