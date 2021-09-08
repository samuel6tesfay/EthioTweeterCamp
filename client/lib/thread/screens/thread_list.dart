import '../blocs/thread_bloc.dart';
import '../blocs/thread_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'thread_add_update.dart';
import 'thread_detail.dart';
import 'thread_route.dart';

class ThreadsList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Threads'),
      ),
      body: BlocBuilder<ThreadBloc, ThreadState>(
        builder: (_, state) {
          if (state is ThreadOperationFailure) {
            return Text('Could not do course operation');
          }

          if (state is ThreadOperationSuccess) {
            final threads = state.threads;

            return ListView.builder(
              itemCount: threads.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${threads.elementAt(idx).title}'),
                subtitle: Text('${threads.elementAt(idx).code}'),
                onTap: () => Navigator.of(context).pushNamed(
                    ThreadDetail.routeName,
                    arguments: threads.elementAt(idx)),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateThread.routeName,
          arguments: ThreadArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
