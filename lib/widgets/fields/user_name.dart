import 'package:flutter/material.dart';
import '../../widgets/borders/text_field_border.dart';
import '../../extensions/form_fields_validator.dart';

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