import '../models/trend.dart';
import 'package:equatable/equatable.dart';

abstract class TrendEvent extends Equatable {
  const TrendEvent();
}

class TrendLoad extends TrendEvent {
  const TrendLoad();

  @override
  List<Object> get props => [];
}

class TrendCreate extends TrendEvent {
  final Trend trend;

  const TrendCreate(this.trend);

  @override
  List<Object> get props => [trend];

  @override
  String toString() => 'Thread Created {course: $trend}';
}

class TrendUpdate extends TrendEvent {
  final Trend trend;

  const TrendUpdate(this.trend);

  @override
  List<Object> get props => [trend];

  @override
  String toString() => 'Course Updated {trend: $trend}';
}

class TrendDelete extends TrendEvent {
  final int id;

  const TrendDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'trend Deleted {trend Id: $id}';
}
