import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DefaultParams extends Equatable {
  final bool? isDeleted;
  final BuildContext? context;

  const DefaultParams({this.isDeleted, this.context});

  @override
  List<Object?> get props => [isDeleted, context];
}
