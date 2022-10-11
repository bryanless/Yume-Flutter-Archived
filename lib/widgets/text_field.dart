import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YumeOutlinedTextField extends StatelessWidget {
  const YumeOutlinedTextField({
    super.key,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.autofocus = false,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.autovalidateMode,
  });

  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool autofocus;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      keyboardType: keyboardType,
      autofocus: autofocus,
      onSaved: onSaved,
      validator: validator,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
    );
  }
}

class YumeDropdownTextField extends StatelessWidget {
  const YumeDropdownTextField({
    super.key,
    required this.options,
    this.value,
    this.hint,
    required this.onChanged,
    this.labelText,
    this.prefixIcon,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
  });

  final List<String> options;
  final String? value;
  final String? hint;
  final void Function(String?)? onChanged;
  final String? labelText;
  final IconData? prefixIcon;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: options
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      value: value,
      hint: hint != null ? Text(hint!) : null,
      onChanged: onChanged,
      // autofocus: ,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}
