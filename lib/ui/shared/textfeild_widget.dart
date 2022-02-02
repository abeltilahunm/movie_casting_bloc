import 'package:flutter/material.dart';

class InputTextField extends TextField {
  InputTextField({
    Key? key,
    required TextEditingController controller,
    required String hint,
    required bool obscureText,
    required bool hasError,
    required String errorText,
    Function? validator,
  }) : super(
            key: key,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              errorText: hasError ? errorText : "",

              border: const OutlineInputBorder().copyWith(
                borderSide:
                    const BorderSide(color: Colors.greenAccent, width: 5.0),
              ), // set border width
            ),
            obscureText: obscureText,
            onChanged: validator == null
                ? (String value) => {}
                : (String value) => validator(value));
}
