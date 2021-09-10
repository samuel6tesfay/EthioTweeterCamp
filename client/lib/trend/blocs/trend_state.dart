import '../models/trend.dart';
import 'package:equatable/equatable.dart';

abstract class TrendState extends Equatable {
  const TrendState();

  @override
  List<Object> get props => [];
}

class TrendLoading extends TrendState {}

class TrendOperationSuccess extends TrendState {
  final Iterable<Trend> trends;

  TrendOperationSuccess([this.trends = const []]);

  @override
  List<Object> get props => [trends];
}

class TrendOperationFailure extends TrendState {}
