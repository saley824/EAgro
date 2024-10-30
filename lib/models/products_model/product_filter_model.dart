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

  // Copy function
  ProductFilterModel copyWith({
    bool? hasDiscount,
    CategoryModel? category,
    CategoryModel? superCategory,
    String? searchTerm,
    double? fromPrice,
    double? toPrice,
  }) {
    return ProductFilterModel(
      hasDiscount: hasDiscount ?? this.hasDiscount,
      category: category ?? this.category,
      superCategory: superCategory ?? this.superCategory,
      searchTerm: searchTerm ?? this.searchTerm,
      fromPrice: fromPrice ?? this.fromPrice,
      toPrice: toPrice ?? this.toPrice,
    );
  }
}
