import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? info;
  final TextInputType? input;

  const CustomTextFormField({
    super.key,
    required this.info,
    required this.input,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            label: Text(widget.info!),
          ),
          keyboardType: widget.input,
        ),
      ),
    );
  }
}
