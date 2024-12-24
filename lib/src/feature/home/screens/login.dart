import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/screens/register.dart';
import 'package:task3/src/feature/home/widget/login_button.dart';
import 'package:task3/src/feature/home/widget/login_fields_list.dart';
import 'package:task3/src/feature/widgets/custom_text_field.dart';

class LoginData {
  final String email;
  final String password;

  LoginData({required this.email, required this.password});
}

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Login",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildLoginForm(context),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: SizedBox(
            height:200,
            child: ListView.builder(
              itemCount: loginFields.length,
              itemBuilder: (context, index) {
                return CustomTextField(
                  model: loginFields[index],
                );
              },
            ),
          ),
        ),
        LoginButton(formKey: _formKey),
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
             
            },
            child: const Text(
              "You don't have an account? Register",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ),
        ),
       
      ],
    );
  }
}
