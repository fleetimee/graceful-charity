// ignore_for_file: unused_field

import 'package:black/randomizer_page.dart';
import 'package:black/range_selector_form.dart';
import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Select Range')),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValuesetter: (value) => _min = value,
        maxValuesetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Validate the form

          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RandomizerPage(min: _min, max: _max)));
          }

          // TODO: Navigate to the generator page
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
