import '../blocs/mostRelevantPeople_bloc.dart';
import '../blocs/mostRelevantPeople_event.dart';
import '../models/mostRelevantPeople.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mostRelevantPeople_add_update.dart';
import 'mostRelevantPeople_route.dart';
import 'mostRelevantPeople_list.dart';

class MostRelevantPeopleDetail extends StatelessWidget {
  static const routeName = 'mostRelevantPeopleDetail';
  final MostRelevantPeople mostRelevantPeople;

  MostRelevantPeopleDetail({required this.mostRelevantPeople});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.mostRelevantPeople.body}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateMostRelevantPeople.routeName,
              arguments: MostRelevantPeopleArgument(mostRelevantPeople: this.mostRelevantPeople, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<MostRelevantPeopleBloc>(context)
                    .add(MostRelevantPeopleDelete(this.mostRelevantPeople.id ?? 0));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    TrendsList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.mostRelevantPeople.body}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.mostRelevantPeople.body ),
          ],
        ),
      ),
    );
  }
}
