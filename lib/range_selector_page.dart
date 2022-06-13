// ignore_for_file: unused_field

import 'package:black/randomizer_page.dart';
import 'package:black/range_selector_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RangeSelectorPage extends HookWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Select Range')),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValuesetter: (value) => min.value = value,
        maxValuesetter: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Validate the form

          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    RandomizerPage(min: min.value, max: max.value)));
          }

          // TODO: Navigate to the generator page
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
