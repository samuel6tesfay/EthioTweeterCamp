import '../data_providers/thread-data-provider.dart';
import '../models/thread.dart';

class ThreadRepository {
  final ThreadDataProvider dataProvider;
  ThreadRepository(this.dataProvider);

  Future<Thread> create(Thread thread) async {
    return this.dataProvider.create(thread);
  }

  Future<Thread> update(int id, Thread thread) async {
    return this.dataProvider.update(id, thread);
  }

  Future<List<Thread>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    this.dataProvider.delete(id);
  }
}
