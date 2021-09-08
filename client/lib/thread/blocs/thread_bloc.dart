import '/thread/repository/thread-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'thread_event.dart';
import 'thread_state.dart';

class ThreadBloc extends Bloc<ThreadEvent, ThreadState> {
  final ThreadRepository threadRepository;

  ThreadBloc({required this.threadRepository}) : super(ThreadLoading());

  @override
  Stream<ThreadState> mapEventToState(ThreadEvent event) async* {
    if (event is ThreadLoad) {
      yield ThreadLoading();
      try {
        final threads = await threadRepository.fetchAll();
        yield ThreadOperationSuccess(threads);
      } catch (_) {
        yield ThreadOperationFailure();
      }
    }

    if (event is ThreadCreate) {
      try {
        await threadRepository.create(event.thread);
        final threads = await threadRepository.fetchAll();
        yield ThreadOperationSuccess(threads);
      } catch (_) {
        yield ThreadOperationFailure();
      }
    }

    if (event is ThreadUpdate) {
      try {
        await threadRepository.update(event.thread.id ?? 0, event.thread);
        final threads = await threadRepository.fetchAll();
        yield ThreadOperationSuccess(threads);
      } catch (_) {
        yield ThreadOperationFailure();
      }
    }

    if (event is ThreadDelete) {
      try {
        await threadRepository.delete(event.id);
        final threads = await threadRepository.fetchAll();
        yield ThreadOperationSuccess(threads);
      } catch (_) {
        yield ThreadOperationFailure();
      }
    }
  }
}
