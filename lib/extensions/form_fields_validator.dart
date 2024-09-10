extension FormFieldsValidator on String {
  get isUserNameValid => isNotEmpty && length > 2;

  get isUserEmailValid => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  get isUserPhoneValid => RegExp(r'^[+]?(?:[0-9]{2})?[0-9]{10}$').hasMatch(this);
}