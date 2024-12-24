import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/screens/mass.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
   
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child:
       ElevatedButton(
        
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
            
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful!')),
            );
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MassScreen()),
              );
          } 
            
        },
        child:
         const Text('Login',style: TextStyle(
          fontSize: 16,
         ),
         ),
      ),
    );
  }
}
