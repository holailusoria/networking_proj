import 'package:flutter/material.dart';
import '../borders/text_field_border.dart';
import '../../../core/utils/form_fields_validation_util.dart';

Padding userNameField(TextEditingController userNameController) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        border: textFieldBorder,
      ),
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      validator: (input) => !input!.isUserNameValid ? 'Incorrect username' : null,
    ),
  );
}