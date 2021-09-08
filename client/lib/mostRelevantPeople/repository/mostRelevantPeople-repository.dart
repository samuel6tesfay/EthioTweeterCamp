import '../data_providers/mostRelevantPeople-data-provider.dart';
import '../models/mostRelevantPeople.dart';

class MostRelevantPeopleRepository {
  final MostRelevantPeopleDataProvider dataProvider;
  MostRelevantPeopleRepository(this.dataProvider);

  Future<MostRelevantPeople> create(MostRelevantPeople mostRelevantPeople) async {
    return this.dataProvider.create(mostRelevantPeople);
  }

  Future<MostRelevantPeople> update(int id, MostRelevantPeople mostRelevantPeople) async {
    return this.dataProvider.update(id, mostRelevantPeople);
  }

  Future<List<MostRelevantPeople>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    this.dataProvider.delete(id);
  }
}
