import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/screens/login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _formKey = formKey, _emailController = emailController, _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
    
        foregroundColor: Colors.white, backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(
            vertical: 14, horizontal: 32), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        elevation: 5, 
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final loginData = LoginData(
            email: _emailController.text,
            password: _passwordController.text,
          );
          
          // ignore: avoid_print
          print(
              'Email: ${loginData.email}, Password: ${loginData.password}');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );
        }
      },
      child:
       const Text('Login',style: TextStyle(
        fontSize: 16,
       ),),
    );
  }
}
