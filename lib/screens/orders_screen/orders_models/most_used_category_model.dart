import 'package:json_annotation/json_annotation.dart';

part 'most_used_category_model.g.dart';

@JsonSerializable()
class MostUsedCategoryModel {
  final String categoryId;
  final  int count ;


  MostUsedCategoryModel({
    required this.categoryId,
    required this.count,
 
  });

  factory MostUsedCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MostUsedCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$MostUsedCategoryModelToJson(this);
}
