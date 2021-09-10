import '../blocs/trend_bloc.dart';
import '../blocs/trend_event.dart';
import '../models/trend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'trend_add_update.dart';
import 'trend_route.dart';
import 'trend_list.dart';

class TrendDetail extends StatelessWidget {
  static const routeName = 'trendDetail';
  final Trend trend;

  TrendDetail({required this.trend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.trend.body}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateTrend.routeName,
              arguments: TrendArgument(trend: this.trend, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<TrendBloc>(context)
                    .add(TrendDelete(this.trend.id ?? 0));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    TrendsList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.trend.body}'),
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
            Text(this.trend.body ),
          ],
        ),
      ),
    );
  }
}
