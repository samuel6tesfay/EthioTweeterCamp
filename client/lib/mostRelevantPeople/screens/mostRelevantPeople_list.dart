import '../blocs/mostRelevantPeople_bloc.dart';
import '../blocs/mostRelevantPeople_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mostRelevantPeople_add_update.dart';
import 'mostRelevantPeople_detail.dart';
import 'mostRelevantPeople_route.dart';

class MostRelevantPeoplesList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of MostRelevantPeoples'),
      ),
      body: BlocBuilder<MostRelevantPeopleBloc, MostRelevantPeopleState>(
        builder: (_, state) {
          if (state is MostRelevantPeopleOperationFailure) {
            return Text('Could not do mostRelevantPeople operation');
          }

          if (state is MostRelevantPeopleOperationSuccess) {
            final mostRelevantPeoples = state.mostRelevantPeoples;

            return ListView.builder(
              itemCount: mostRelevantPeoples.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${mostRelevantPeoples.elementAt(idx).body}'),
                onTap: () => Navigator.of(context).pushNamed(
                    MostRelevantPeopleDetail.routeName,
                    arguments: mostRelevantPeoples.elementAt(idx)),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateMostRelevantPeople.routeName,
          arguments: MostRelevantPeopleArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
