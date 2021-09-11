import '../blocs/mostRelevantPeople_bloc.dart';
import '../blocs/mostRelevantPeople_event.dart';
import '../models/mostRelevantPeople.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mostRelevantPeople_route.dart';
import 'mostRelevantPeople_list.dart';

class AddUpdateMostRelevantPeople extends StatefulWidget {
  static const routeName = 'mostRelevantPeopleAddUpdate';
  final MostRelevantPeopleArgument args;

  AddUpdateMostRelevantPeople({required this.args});
  @override
  _AddUpdateMostRelevantPeopleState createState() => _AddUpdateMostRelevantPeopleState();
}

class _AddUpdateMostRelevantPeopleState extends State<AddUpdateMostRelevantPeople> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _mostRelevantPeople = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit MostRelevantPeople" : "Add New MostRelevantPeople"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.mostRelevantPeople?.name: '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter mostRelevantPeople';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'MostRelevantPeople'),
                  onSaved: (value) {
                    setState(() {
                      this._mostRelevantPeople["name"] = value;
                    });
                  }),
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final MostRelevantPeopleEvent event = widget.args.edit
                          ? MostRelevantPeopleUpdate(
                              MostRelevantPeople(
                                id: widget.args.mostRelevantPeople?.id,
                                name: this._mostRelevantPeople["name"],

                              ),
                            )
                          : MostRelevantPeopleCreate(
                              MostRelevantPeople(
                                name: this._mostRelevantPeople["name"],
                              ),
                            );
                      BlocProvider.of<MostRelevantPeopleBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MostRelevantPeoplesList.routeName, (route) => false);
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
