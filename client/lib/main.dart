import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'thread/bloc_observer.dart';
import 'thread/blocs/blocs.dart';
import 'thread/data_providers/thread-data-provider.dart';
import 'thread/repository/thread-repository.dart';
import 'thread/screens/thread_route.dart';

// import 'thread/bloc_observer.dart';
import 'trend/blocs/blocs.dart';
import 'trend/data_providers/trend-data-provider.dart';
import 'trend/repository/trend-repository.dart';
import 'trend/screens/trend_route.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final ThreadRepository threadRepository = ThreadRepository(ThreadDataProvider());

  runApp(
    ThreadApp(threadRepository: threadRepository),
  );
}

class ThreadApp extends StatelessWidget {
  final ThreadRepository threadRepository;

  ThreadApp({required this.threadRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.threadRepository,
      child: BlocProvider(
        create: (context) => ThreadBloc(threadRepository: this.threadRepository)
          ..add(ThreadLoad()),
        child: MaterialApp(
          title: 'Thread App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: ThreadAppRoute.generateRoute,
        ),
      ),
    );
  }
}

class TrendApp extends StatelessWidget {
  final TrendRepository trendRepository;

  TrendApp({required this.trendRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.trendRepository,
      child: BlocProvider(
        create: (context) => TrendBloc(trendRepository: this.trendRepository)
          ..add(TrendLoad()),
        child: MaterialApp(
          title: 'Trend App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: TrendAppRoute.generateRoute,
        ),
      ),
    );
  }
}