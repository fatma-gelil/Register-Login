import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/model/register_model.dart';
import 'package:task3/src/feature/widgets/custom_text_field.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoState();
}

class _InfoState extends State<InfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Personal Info",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('images/logo.png')),
                  CustomTextField(
                    model: RegisterModel(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      label: 'Name',
                      hint: 'Enter Your Name',
                      prefix: Icons.person,
                    ),
                  ),
                  CustomTextField(
                    model: RegisterModel(
                      controller: dateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a date';
                        }
                        final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                        if (!dateRegex.hasMatch(value)) {
                          return 'Invalid date format. Use YYYY-MM-DD';
                        }
                        final parsedDate = DateTime.tryParse(value);
                        if (parsedDate == null) {
                          return 'Invalid date format. Use YYYY-MM-DD';
                        }
                        if (parsedDate.isBefore(DateTime(1000))) {
                          return 'Date cannot be before the year 1000';
                        }

                        return null;
                      },
                      label: 'Date of Birth',
                      hint: 'Enter Your Date of Birth',
                      prefix: Icons.date_range,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 32),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              name: nameController.text,
                              age: calcYears(dateController.text).toString(),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Details"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int calcYears(String date) {
    try {
      DateTime birthDate = DateTime.parse(date);
      DateTime currentDate = DateTime.now();
      Duration difference = currentDate.difference(birthDate);
      return (difference.inDays / 365).floor();
    } catch (e) {
      return 0;
    }
  }
}

class Details extends StatelessWidget {
  final String name;
  final String age;

  const Details({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Personal Info",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            Text('Age: $age',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
