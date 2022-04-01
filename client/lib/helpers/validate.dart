class ValidateInput {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Email can't be empty";
    }

    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (!regex.hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password can't be empty";
    }

    if (value.length < 8) {
      return "Password length must greater than 8 character";
    }

    return null;
  }
}
