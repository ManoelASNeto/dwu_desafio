import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? info;
  final TextInputType? input;

  CustomTextFormField({
    super.key,
    required this.info,
    required this.input,
  });

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
            label: Text(info!),
          ),
          keyboardType: input,
        ),
      ),
    );
  }
}
