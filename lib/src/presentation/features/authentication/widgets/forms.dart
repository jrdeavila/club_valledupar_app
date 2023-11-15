import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.label,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isPassword = false,
    this.helpText,
    this.errors,
    this.controller,
  });

  final String label;
  final TextEditingController? controller;
  final IconData? icon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final bool isPassword;
  final String? helpText;
  final List<String>? errors;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool _visible;
  @override
  void initState() {
    super.initState();
    _visible = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Get.find<ColorPalete>().blurredChildColor;
    final Color textColor = Get.find<ColorPalete>().textOnPrimary;
    final Color cursorColor = Get.find<ColorPalete>().textOnSecondary;
    final Color errorColor = Get.find<ColorPalete>().componentOnError;
    return TextFormField(
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      cursorColor: cursorColor,
      keyboardType: widget.keyboardType,
      enabled: widget.onChanged != null,
      controller: widget.controller,
      obscureText: _visible,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
                color: textColor,
              )
            : null,
        suffixIcon: widget.isPassword ? _toggleVisibilityWidget() : null,
        hintText: widget.label,
        hintStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        helperText: widget.helpText,
        helperMaxLines: 3,
        fillColor: backgroundColor,
        filled: true,
        border: OutlineInputBorder(
          gapPadding: 12,
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorText:
            widget.errors?.isEmpty ?? true ? null : widget.errors?.join('\n'),
        errorStyle: TextStyle(
          color: errorColor,
        ),
      ),
    );
  }

  Widget _toggleVisibilityWidget() => GestureDetector(
        onTap: () => setState(() => _visible = !_visible),
        child: Icon(
          _visible ? Icons.visibility : Icons.visibility_off,
          color: Get.find<ColorPalete>().textOnPrimary,
        ),
      );
}
