import 'package:flutter/material.dart';

typedef intValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm(
      {Key? key,
      required this.formKey,
      required this.minValuesetter,
      required this.maxValuesetter})
      : super(key: key);

  final GlobalKey<FormState> formKey;

  final intValueSetter minValuesetter;
  final intValueSetter maxValuesetter;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                  labelText: 'Minimum', intValuesetter: minValuesetter),
              SizedBox(height: 12),
              RangeSelectorTextFormField(
                  labelText: 'Maximum', intValuesetter: maxValuesetter),
            ],
          ),
        ));
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField(
      {Key? key, required this.labelText, required this.intValuesetter})
      : super(key: key);

  final String labelText;
  final intValueSetter intValuesetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: labelText),
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      onSaved: (newValue) => intValuesetter(int.parse(newValue ?? '')),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },
    );
  }
}
