import '../models/mostRelevantPeople.dart';
import 'package:equatable/equatable.dart';

abstract class MostRelevantPeopleEvent extends Equatable {
  const MostRelevantPeopleEvent();
}

class MostRelevantPeopleLoad extends MostRelevantPeopleEvent {
  const MostRelevantPeopleLoad();

  @override
  List<Object> get props => [];
}

class MostRelevantPeopleCreate extends MostRelevantPeopleEvent {
  final MostRelevantPeople mostRelevantPeople;

  const MostRelevantPeopleCreate(this.mostRelevantPeople);

  @override
  List<Object> get props => [mostRelevantPeople];

  @override
  String toString() => 'Thread Created {MostRelevantPeople: $mostRelevantPeople}';
}

class MostRelevantPeopleUpdate extends MostRelevantPeopleEvent {
  final MostRelevantPeople mostRelevantPeople;

  const MostRelevantPeopleUpdate(this.mostRelevantPeople);

  @override
  List<Object> get props => [mostRelevantPeople];

  @override
  String toString() => 'mostRelevantPeople Updated {mostRelevantPeople: $mostRelevantPeople}';
}

class MostRelevantPeopleDelete extends MostRelevantPeopleEvent {
  final int id;

  const MostRelevantPeopleDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'mostRelevantPeople Deleted {mostRelevantPeople Id: $id}';
}
