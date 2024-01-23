import 'package:json_annotation/json_annotation.dart';

part 'json_serializable_example_model.g.dart';

@JsonSerializable()
class JsonSerializableExampleModel{
  /// The generated code assumes these values exist in JSON.
  final String stringParam;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? dateTimeParam;

  JsonSerializableExampleModel({required this.stringParam, required this.dateTimeParam});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory JsonSerializableExampleModel.fromJson(Map<String, dynamic> json) => _$JsonSerializableExampleModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$JsonSerializableExampleModelToJson(this);
}

///COMMAND FOR GENERATING MODELS [dart run build_runner build]