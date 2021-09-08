import '/thread/models/thread.dart';
import 'package:equatable/equatable.dart';

abstract class ThreadEvent extends Equatable {
  const ThreadEvent();
}

class ThreadLoad extends ThreadEvent {
  const ThreadLoad();

  @override
  List<Object> get props => [];
}

class ThreadCreate extends ThreadEvent {
  final Thread thread;

  const ThreadCreate(this.thread);

  @override
  List<Object> get props => [thread];

  @override
  String toString() => 'Thread Created {course: $thread}';
}

class ThreadUpdate extends ThreadEvent {
  final Thread thread;

  const ThreadUpdate(this.thread);

  @override
  List<Object> get props => [thread];

  @override
  String toString() => 'Course Updated {course: $thread}';
}

class ThreadDelete extends ThreadEvent {
  final int id;

  const ThreadDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Thread Deleted {thread Id: $id}';
}
