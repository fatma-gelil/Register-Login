import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/widget/register_button.dart';
import 'package:task3/src/feature/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // name
              CustomTextField(
                label: 'Name',
                hint: 'Enter your name',
                prefix: Icons.person,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  } else if (value.length < 3) {
                    return 'Name must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // id
              CustomTextField(
                label: 'National ID',
                hint: 'Enter your national ID',
                prefix: Icons.credit_card,
                controller: _nationalIdController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your national ID';
                  } else if (value.length != 14) {
                    return 'National ID must be 14 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // phone number
              CustomTextField(
                label: 'Phone Number',
                hint: 'Enter your phone number',
                prefix: Icons.phone,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (value.length != 11) {
                    return 'Phone number must be 11 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // email
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                prefix: Icons.email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Password
              CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                prefix: Icons.lock,
                controller: _passwordController,
                obscureText: true, // Make the text obscured (for password)
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // token
              CustomTextField(
                label: 'Token',
                hint: 'Enter the token',
                prefix: Icons.lock_open,
                controller: _tokenController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the token';
                  } else if (value.length < 5) {
                    return 'Token must be at least 5 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              RegisterButton(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}
