import '../models/mostRelevantPeople.dart';
import 'package:flutter/material.dart';

import 'mostRelevantPeople_add_update.dart';
import 'mostRelevantPeople_detail.dart';
import 'mostRelevantPeople_list.dart';

class MostRelevantPeopleAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => MostRelevantPeoplesList());
    }

    if (settings.name == AddUpdateMostRelevantPeople.routeName) {
      MostRelevantPeopleArgument args = settings.arguments as MostRelevantPeopleArgument;
      return MaterialPageRoute(
        builder: (context) => AddUpdateMostRelevantPeople(
          args: args,
        ),
      );
    }

    if (settings.name == MostRelevantPeopleDetail.routeName) {
      MostRelevantPeople mostRelevantPeople = settings.arguments as MostRelevantPeople;
      return MaterialPageRoute(
        builder: (context) => MostRelevantPeopleDetail(
          mostRelevantPeople: mostRelevantPeople,
        ),
      );
    }

    return MaterialPageRoute(builder: (context) => MostRelevantPeoplesList());
  }
}

class MostRelevantPeopleArgument {
  final MostRelevantPeople? mostRelevantPeople;
  final bool edit;
  MostRelevantPeopleArgument({this.mostRelevantPeople, required this.edit});
}
