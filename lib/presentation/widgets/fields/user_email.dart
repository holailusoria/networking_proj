import 'package:flutter/material.dart';
import '../borders/text_field_border.dart';
import '../../../core/utils/form_fields_validation_util.dart';

Padding userEmailField(TextEditingController emailController) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: textFieldBorder,
      ),
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      validator: (input) => !input!.isUserEmailValid ? 'Incorrect email' : null,
    ),
  );
}