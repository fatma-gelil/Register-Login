import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/model/register_model.dart';

final TextEditingController heightcontroller = TextEditingController();
final TextEditingController weightController = TextEditingController();

List<RegisterModel> bodyMass = [
  RegisterModel(
    label: 'height',
    hint: 'Enter your height',
    prefix: Icons.height,
    controller: heightcontroller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your height';
      } else {
        return null;
      }
    }
     ,keyboardType: TextInputType.text, obscureText: false,
  ),
  RegisterModel(
    label: 'weight',
    hint: 'Enter your weight',
    prefix: Icons.line_weight,
    controller: weightController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your weight';
      } else{
      return null;
    }},
     keyboardType: TextInputType.text, obscureText: false,
  ),
];
