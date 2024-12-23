import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/model/register_model.dart';
import 'package:task3/src/feature/widgets/border_text_field.dart';

class CustomTextField extends StatelessWidget {
  final RegisterModel model;
  

  const CustomTextField({
    super.key,
    required this.model,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        controller: model.controller,
        validator: model.validator,
        obscureText: model.obscureText,
        keyboardType: model.keyboardType,
        decoration: InputDecoration(
          labelText: model.label,
          hintText: model.hint,
          prefixIcon:Icon(model.prefix) ,
          border: border(color: Colors.white, radius: 50),
        ),
      ),
    );
  }
}
