import '../repository/mostRelevantPeople-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mostRelevantPeople_event.dart';
import 'mostRelevantPeople_state.dart';

class MostRelevantPeopleBloc extends Bloc<MostRelevantPeopleEvent, MostRelevantPeopleState> {
  final MostRelevantPeopleRepository mostRelevantPeopleRepository;

  MostRelevantPeopleBloc({required this.mostRelevantPeopleRepository}) : super(MostRelevantPeopleLoading());

  @override
  Stream<MostRelevantPeopleState> mapEventToState(MostRelevantPeopleEvent event) async* {
    if (event is MostRelevantPeopleLoad) {
      yield MostRelevantPeopleLoading();
      try {
        final mostRelevantPeoples = await mostRelevantPeopleRepository.fetchAll();
        yield MostRelevantPeopleOperationSuccess(mostRelevantPeoples);
      } catch (_) {
        yield MostRelevantPeopleOperationFailure();
      }
    }

    if (event is MostRelevantPeopleCreate) {
      try {
        await mostRelevantPeopleRepository.create(event.mostRelevantPeople);
        final mostRelevantPeoples = await mostRelevantPeopleRepository.fetchAll();
        yield MostRelevantPeopleOperationSuccess(mostRelevantPeoples);
      } catch (_) {
        yield MostRelevantPeopleOperationFailure();
      }
    }

    if (event is MostRelevantPeopleUpdate) {
      try {
        await mostRelevantPeopleRepository.update(event.mostRelevantPeople.id ?? 0, event.mostRelevantPeople);
        final mostRelevantPeoples = await mostRelevantPeopleRepository.fetchAll();
        yield MostRelevantPeopleOperationSuccess(mostRelevantPeoples);
      } catch (_) {
        yield MostRelevantPeopleOperationFailure();
      }
    }

    if (event is MostRelevantPeopleDelete) {
      try {
        await mostRelevantPeopleRepository.delete(event.id);
        final mostRelevantPeoples = await mostRelevantPeopleRepository.fetchAll();
        yield MostRelevantPeopleOperationSuccess(mostRelevantPeoples);
      } catch (_) {
        yield MostRelevantPeopleOperationFailure();
      }
    }
  }
}
