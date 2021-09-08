import '../models/mostRelevantPeople.dart';
import 'package:equatable/equatable.dart';

abstract class MostRelevantPeopleState extends Equatable {
  const MostRelevantPeopleState();

  @override
  List<Object> get props => [];
}

class MostRelevantPeopleLoading extends MostRelevantPeopleState {}

class MostRelevantPeopleOperationSuccess extends MostRelevantPeopleState {
  final Iterable<MostRelevantPeople> mostRelevantPeoples;

  MostRelevantPeopleOperationSuccess([this.mostRelevantPeoples = const []]);

  @override
  List<Object> get props => [mostRelevantPeoples];
}

class MostRelevantPeopleOperationFailure extends MostRelevantPeopleState {}
