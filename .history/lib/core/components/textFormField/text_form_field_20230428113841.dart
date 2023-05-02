import 'package:auth_with_bloc/core/constants/app/color_constants.dart';
import 'package:auth_with_bloc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/typedefs.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
  });

  final TextEditingController? controller;
  final ChangeFunction onChanged;
  final String? hintText;
  final ValidatorFunction validator;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        cursorColor: ColorConstants.teal,
        decoration: InputDecoration(
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.dynamicHeight(10)),
            borderSide: const BorderSide(color: ColorConstants.teal),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.dynamicHeight(10)),
            borderSide: const BorderSide(color: ColorConstants.teal),
          ),
        ),
      ),
    );
  }
}