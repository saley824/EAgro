import '../category_model/category_model.dart';

class ProductFilterModel {
  bool hasDiscount;
  CategoryModel? category;
  CategoryModel? superCategory;
  String? searchTerm;
  double? fromPrice;
  double? toPrice;

  ProductFilterModel({
    this.hasDiscount = false,
    this.category,
    this.superCategory,
    this.searchTerm,
    this.fromPrice,
    this.toPrice,
  });
}
