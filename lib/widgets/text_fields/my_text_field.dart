import 'package:flutter/material.dart';

import '../../helpers/my_decoration.dart';

class MyTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int? maxLength;

  const MyTextField({
    Key? key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onSubmitted,
    this.fillColor,
    this.validator,
    this.textInputAction,
    this.textInputType,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      maxLength: maxLength,
      focusNode: focusNode,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      keyboardType: textInputType,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 12, 15),
        isDense: true,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // fillColor: fillColor ?? theme.inputDecorationTheme.fillColor,
        hintText: hintText,
        hintStyle: TextStyle(color: theme.iconTheme.color),
        filled: true,
        focusColor: theme.primaryColor,
        enabledBorder: MyDecoration.inputBorder,
        focusedBorder: MyDecoration.inputBorder,
        border: MyDecoration.inputBorder,

        // contentPadding: EdgeInsets.only(left: .padding),
      ),
    );
  }
}
