import 'package:flutter/material.dart';
import '../../widgets/borders/text_field_border.dart';
import '../../extensions/form_fields_validator.dart';

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