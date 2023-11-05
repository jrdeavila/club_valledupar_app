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
    this.onControllingText,
    this.errors,
  });

  final String label;
  final IconData? icon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final bool isPassword;
  final String? helpText;
  final List<String>? errors;
  final void Function(TextEditingController)? onControllingText;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool _visible;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _visible = widget.isPassword;
    widget.onControllingText?.call(_controller);
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
      controller: _controller,
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
