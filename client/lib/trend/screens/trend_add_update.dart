import '../blocs/trend_bloc.dart';
import '../blocs/trend_event.dart';
import '../models/trend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'trend_route.dart';
import 'trend_list.dart';

class AddUpdateTrend extends StatefulWidget {
  static const routeName = 'threadAddUpdate';
  final TrendArgument args;

  AddUpdateTrend({required this.args});
  @override
  _AddUpdateTrendState createState() => _AddUpdateTrendState();
}

class _AddUpdateTrendState extends State<AddUpdateTrend> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _trend = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Trend" : "Add New Trend"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.trend?.body: '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter trend code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Trend Code'),
                  onSaved: (value) {
                    setState(() {
                      this._trend["body"] = value;
                    });
                  }),
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final TrendEvent event = widget.args.edit
                          ? TrendUpdate(
                              Trend(
                                id: widget.args.trend?.id,
                                body: this._trend["body"],
                              ),
                            )
                          : TrendCreate(
                              Trend(
                                body: this._trend["body"],
                              ),
                            );
                      BlocProvider.of<TrendBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          TrendsList.routeName, (route) => false);
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
