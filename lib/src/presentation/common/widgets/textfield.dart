import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTxtField extends StatelessWidget {
  const AppTxtField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.initialValue,
    this.onChange,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.secondary = false,
    this.errors,
  });

  final String hintText;
  final Icon? prefixIcon;
  final bool isPassword;
  final String? initialValue;
  final Function(String)? onChange;
  final int minLines, maxLines;
  final int? maxLength;
  final bool secondary;

  final List<String>? errors;

  @override
  Widget build(BuildContext context) {
    final textColor = Get.find<ColorPalete>().textOnSecondary;
    final bgColor = Get.find<ColorPalete>().componentColor;
    return TextFormField(
      style: TextStyle(
        color: textColor,
        fontSize: 18.0,
      ),
      cursorColor: textColor,
      cursorWidth: 2,
      initialValue: initialValue,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChange,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: textColor),
        prefixIcon: prefixIcon,
        errorText: errors?.isEmpty ?? true ? null : errors?.join('\n'),
      ),
    );
  }
}
