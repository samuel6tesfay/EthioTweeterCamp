import '../blocs/trend_bloc.dart';
import '../blocs/trend_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'trend_add_update.dart';
import 'trend_detail.dart';
import 'trend_route.dart';

class TrendsList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Trends'),
      ),
      body: BlocBuilder<TrendBloc, TrendState>(
        builder: (_, state) {
          if (state is TrendOperationFailure) {
            return Text('Could not do trend operation');
          }

          if (state is TrendOperationSuccess) {
            final trends = state.trends;

            return ListView.builder(
              itemCount: trends.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${trends.elementAt(idx).body}'),
                onTap: () => Navigator.of(context).pushNamed(
                    TrendDetail.routeName,
                    arguments: trends.elementAt(idx)),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateTrend.routeName,
          arguments: TrendArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
