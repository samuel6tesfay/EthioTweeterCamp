import '../models/thread.dart';
import 'package:flutter/material.dart';

import 'thread_add_update.dart';
import 'thread_detail.dart';
import 'thread_list.dart';

class ThreadAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => ThreadsList());
    }

    if (settings.name == AddUpdateThread.routeName) {
      ThreadArgument args = settings.arguments as ThreadArgument;
      return MaterialPageRoute(
        builder: (context) => AddUpdateThread(
          args: args,
        ),
      );
    }

    if (settings.name == ThreadDetail.routeName) {
      Thread thread = settings.arguments as Thread;
      return MaterialPageRoute(
        builder: (context) => ThreadDetail(
          thread: thread,
        ),
      );
    }

    return MaterialPageRoute(builder: (context) => ThreadsList());
  }
}

class ThreadArgument {
  final Thread? thread;
  final bool edit;
  ThreadArgument({this.thread, required this.edit});
}
