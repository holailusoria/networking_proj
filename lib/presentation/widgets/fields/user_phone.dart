import 'package:flutter/material.dart';
import '../borders/text_field_border.dart';
import '../../../core/utils/form_fields_validation_util.dart';

Padding userPhoneField(TextEditingController phoneController) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: 'Phone number',
        border: textFieldBorder,
      ),
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      validator: (input) => !input!.isUserPhoneValid ? 'Incorrect phone number' : null,
    ),
  );
}