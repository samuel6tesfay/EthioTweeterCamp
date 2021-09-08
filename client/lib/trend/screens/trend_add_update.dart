import '../blocs/thread_bloc.dart';
import '../blocs/thread_event.dart';
import '../models/thread.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'thread_route.dart';
import 'thread_list.dart';

class AddUpdateThread extends StatefulWidget {
  static const routeName = 'threadAddUpdate';
  final ThreadArgument args;

  AddUpdateThread({required this.args});
  @override
  _AddUpdateThreadState createState() => _AddUpdateThreadState();
}

class _AddUpdateThreadState extends State<AddUpdateThread> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _thread = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Thread" : "Add New Thread"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.thread?.name: '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter thread code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Thread Code'),
                  onSaved: (value) {
                    setState(() {
                      this._thread["code"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.thread?.body : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter thread title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Thread Title'),
                  onSaved: (value) {
                    this._thread["title"] = value;
                  }),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.thread?.imagePath.toString()
                      : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter thread ects';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Thread ECTS'),
                  onSaved: (value) {
                    setState(() {
                      if (value != null) {
                        this._thread["ects"] = int.parse(value);
                      }
                    });
                  }),
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final ThreadEvent event = widget.args.edit
                          ? ThreadUpdate(
                              Thread(
                                name: this._thread["name"],
                                body: this._thread["body"],
                                imagePath: this._thread["imagePath"],
                              ),
                            )
                          : ThreadCreate(
                              Thread(
                                name: this._thread["name"],
                                body: this._thread["body"],
                                imagePath: this._thread["imagePath"],
                              ),
                            );
                      BlocProvider.of<ThreadBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          ThreadsList.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
