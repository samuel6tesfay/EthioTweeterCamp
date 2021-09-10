import '../models/trend.dart';
import 'package:flutter/material.dart';

import 'trend_add_update.dart';
import 'trend_detail.dart';
import 'trend_list.dart';

class TrendAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => TrendsList());
    }

    if (settings.name == AddUpdateTrend.routeName) {
      TrendArgument args = settings.arguments as TrendArgument;
      return MaterialPageRoute(
        builder: (context) => AddUpdateTrend(
          args: args,
        ),
      );
    }

    if (settings.name == TrendDetail.routeName) {
      Trend trend = settings.arguments as Trend;
      return MaterialPageRoute(
        builder: (context) => TrendDetail(
          trend: trend,
        ),
      );
    }

    return MaterialPageRoute(builder: (context) => TrendsList());
  }
}

class TrendArgument {
  final Trend? trend;
  final bool edit;
  TrendArgument({this.trend, required this.edit});
}
