import 'package:auth_with_bloc/core/components/text/custom_text.dart';
import 'package:auth_with_bloc/core/constants/app/color_constants.dart';
import 'package:auth_with_bloc/core/extensions/context_extensions.dart';
import 'package:auth_with_bloc/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/typedefs.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.validator,
    this.title,
    this.isPassword = false,
  });

  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final ChangeFunction onChanged;
  final ValidatorFunction validator;
  final bool? isPassword;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.pw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            widget.title ?? "",
            textStyle: context.textTheme.titleMedium,
          ),
          10.ph,
          TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            validator: widget.validator,
            cursorColor: ColorConstants.teal,
            obscureText: widget.isPassword ?? false,
            style: GoogleFonts.rubik(),
            decoration: InputDecoration(
              hintText: widget.hintText,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.teal),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.teal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
