import 'dart:developer';

import 'package:msan/models/review_model/review_model.dart';

import '../helpers/http_api.dart';

class ReviewService {
  static Future<bool> makeReview({
    required String productUuid,
    required String userUuid,
    required int rating,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'reviews/makeReview',
        body: {
          "productId": productUuid,
          "userId": userUuid,
          "rating": rating,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION makeReviewTAG : $e");
    }
    return success;
  }

  static Future<ReviewModel?> checkIfUserRatedProduct(
      String userUuid, String productUuid) async {
    ReviewModel? review;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'reviews/isUserRatedProduct/$userUuid/$productUuid',
      );
      if (res.responseData != null) {
        review = ReviewModel.fromJson(res.responseData);
      }
    } catch (e) {
      log('EXCEPTION: $e  checkIfUserRatedProductTAG');
    }
    return review;
  }
}
