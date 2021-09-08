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
                      widget.args.edit ? widget.args.thread?.code : '',
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
                      widget.args.edit ? widget.args.thread?.title : '',
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
                      ? widget.args.thread?.ects.toString()
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
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.thread?.description : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter thread description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Thread Description'),
                  onSaved: (value) {
                    setState(() {
                      this._thread["description"] = value;
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
                                id: widget.args.thread?.id,
                                code: this._thread["code"],
                                title: this._thread["title"],
                                ects: this._thread["ects"],
                                description: this._thread["description"],
                              ),
                            )
                          : ThreadCreate(
                              Thread(
                                id: null,
                                code: this._thread["code"],
                                title: this._thread["title"],
                                ects: this._thread["ects"],
                                description: this._thread["description"],
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
