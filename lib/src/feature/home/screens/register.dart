import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/widget/register_fields_list.dart';
import 'package:task3/src/feature/home/widget/register_button.dart';
import 'package:task3/src/feature/widgets/custom_text_field.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController nationalIdController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController tokenController = TextEditingController();

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Register",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildRegisterForm(),
      ),
    );
  }

  Widget buildRegisterForm() {
    return Column(
      children: [
        Form(
          key: _formKey, 
          child: ListView.builder(
              itemCount: registerFields.length,
              itemBuilder: (context, index) {
                return CustomTextField(model: registerFields[index],); 
              }),
        ),
        RegisterButton(formKey: _formKey)
      ],
    );
  }
}
