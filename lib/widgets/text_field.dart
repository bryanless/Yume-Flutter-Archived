import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YumeOutlinedTextField extends StatelessWidget {
  const YumeOutlinedTextField({
    super.key,
    this.initialValue,
    this.labelText,
    this.hintText,
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
    this.labelText,
    this.hint,
    required this.options,
    required this.onChanged,
    this.value,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
  });

  final String? labelText;
  final String? hint;
  final List<String> options;
  final void Function(String?)? onChanged;
  final String? value;
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
      ),
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}
