import '../repository/trend-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'trend_event.dart';
import 'trend_state.dart';

class TrendBloc extends Bloc<TrendEvent, TrendState> {
  final TrendRepository trendRepository;

  TrendBloc({required this.trendRepository}) : super(TrendLoading());

  @override
  Stream<TrendState> mapEventToState(TrendEvent event) async* {
    if (event is TrendLoad) {
      yield TrendLoading();
      try {
        final trends = await trendRepository.fetchAll();
        yield TrendOperationSuccess(trends);
      } catch (_) {
        yield TrendOperationFailure();
      }
    }

    if (event is TrendCreate) {
      try {
        await trendRepository.create(event.trend);
        final trends = await trendRepository.fetchAll();
        yield TrendOperationSuccess(trends);
      } catch (_) {
        yield TrendOperationFailure();
      }
    }

    if (event is TrendUpdate) {
      try {
        await trendRepository.update(event.trend.id ?? 0, event.trend);
        final trends = await trendRepository.fetchAll();
        yield TrendOperationSuccess(trends);
      } catch (_) {
        yield TrendOperationFailure();
      }
    }

    if (event is TrendDelete) {
      try {
        await trendRepository.delete(event.id);
        final trends = await trendRepository.fetchAll();
        yield TrendOperationSuccess(trends);
      } catch (_) {
        yield TrendOperationFailure();
      }
    }
  }
}
