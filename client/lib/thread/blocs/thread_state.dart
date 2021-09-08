import '../models/thread.dart';
import 'package:equatable/equatable.dart';

abstract class ThreadState extends Equatable {
  const ThreadState();

  @override
  List<Object> get props => [];
}

class ThreadLoading extends ThreadState {}

class ThreadOperationSuccess extends ThreadState {
  final Iterable<Thread> threads;

  ThreadOperationSuccess([this.threads = const []]);

  @override
  List<Object> get props => [threads];
}

class ThreadOperationFailure extends ThreadState {}
