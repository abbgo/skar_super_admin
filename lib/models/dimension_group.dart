class DimensionGroup {
  final String id, name;
  final List<String> dimensions;

  DimensionGroup(
      {required this.id, required this.name, required this.dimensions});

  factory DimensionGroup.fromJson(Map<String, dynamic> json) {
    return DimensionGroup(
      id: json['id'],
      name: json['name'],
      dimensions: json['dimensions'],
    );
  }
}
