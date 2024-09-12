import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DefaultParams extends Equatable {
  final bool? isDeleted;
  final int? page;
  final BuildContext? context;

  const DefaultParams({this.isDeleted, this.page, this.context});

  @override
  List<Object?> get props => [isDeleted, page, context];
}
