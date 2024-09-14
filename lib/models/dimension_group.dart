import 'package:equatable/equatable.dart';

class DimensionGroup {
  final String id, name;
  final List<dynamic> dimensions;

  DimensionGroup(
      {required this.id, required this.name, required this.dimensions});

  factory DimensionGroup.fromJson(Map<String, dynamic> json) {
    return DimensionGroup(
      id: json['id'],
      name: json['name'],
      dimensions: json['dimensions'],
    );
  }

  factory DimensionGroup.defaultValue() {
    return DimensionGroup(id: '', name: '', dimensions: []);
  }
}

class ResultDimensionGroup extends Equatable {
  final List<DimensionGroup>? dimensionGroups;
  final String error;

  const ResultDimensionGroup({this.dimensionGroups, required this.error});

  factory ResultDimensionGroup.defaultResult() {
    return const ResultDimensionGroup(dimensionGroups: null, error: '');
  }

  @override
  List<Object?> get props => [dimensionGroups, error];
}
