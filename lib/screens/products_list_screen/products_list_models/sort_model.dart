class SortModel {
  final String sortBy;
  final String orderBy;

  late String value;

  SortModel({
    required this.sortBy,
    required this.orderBy,
  }) {
    value = sortBy + orderBy;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is SortModel && value == other.value;
  }

  @override
  int get hashCode => Object.hash(value, value);
}
