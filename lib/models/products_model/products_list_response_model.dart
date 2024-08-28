import 'package:json_annotation/json_annotation.dart';

import 'product_list_model.dart';

part 'products_list_response_model.g.dart';

@JsonSerializable()
class ProductsListResponseModel {
  final bool hasNext;
  final int count;
  final List<ProductListModel> products;

  ProductsListResponseModel({
    required this.hasNext,
    required this.count,
    required this.products,
  });

  factory ProductsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsListResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsListResponseModelToJson(this);
}
