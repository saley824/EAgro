class AgroDropdownModel {
  final String id;
  final dynamic value;
  final String text;
  AgroDropdownModel({
    required this.id,
    required this.value,
    required this.text,
  });

  @override
  String toString() {
    return text;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AgroDropdownModel && id == other.id;
  }

  @override
  int get hashCode => Object.hash(id, id);
}
