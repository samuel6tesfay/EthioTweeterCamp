import '../blocs/thread_bloc.dart';
import '../blocs/thread_event.dart';
import '../models/thread.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'thread_add_update.dart';
import 'thread_route.dart';
import 'thread_list.dart';

class ThreadDetail extends StatelessWidget {
  static const routeName = 'threadDetail';
  final Thread thread;

  ThreadDetail({required this.thread});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.thread.code}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateThread.routeName,
              arguments: ThreadArgument(thread: this.thread, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<ThreadBloc>(context)
                    .add(ThreadDelete(this.thread.id ?? 0));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ThreadsList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.thread.title}'),
              subtitle: Text('ECTS: ${this.thread.ects}'),
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
            Text(this.thread.description ?? ""),
          ],
        ),
      ),
    );
  }
}
