import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/widget/mass_list.dart';
import 'package:task3/src/feature/widgets/custom_text_field.dart';

final TextEditingController heightController = TextEditingController();
final TextEditingController weightController = TextEditingController();

class MassScreen extends StatefulWidget {
  const MassScreen({super.key});

  @override
  State<MassScreen> createState() => _MassScreenState();
}

class _MassScreenState extends State<MassScreen> {
  double? result;
  String? shape;

  void calculateBodyMass() {
    final height = double.tryParse(heightController.text);
    final weight = double.tryParse(weightController.text);

    // ignore: avoid_print
    print('Height: $height, Weight: $weight');

    if (height != null && weight != null && height > 0 && weight > 0) {
      setState(() {
        result = weight / (height * height);
        shape = getShape(result!);
        // ignore: avoid_print
        print('Result: $result, Shape: $shape');
      });
    } else {
      setState(() {
        result = null;
        shape = null;
        // ignore: avoid_print
        print('Invalid input. Result set to null.');
      });
    }
  }

  String getShape(double result) {
    if (result < 18.5) {
      return "Skinny";
    } else if (result >= 18.5 && result < 24.9) {
      return "Normal";
    } else if (result >= 25 && result < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Body Mass Calculator",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: bodyMass.length,
                itemBuilder: (context, index) {
                  return CustomTextField(
                    model: bodyMass[index],
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              elevation: 5,
            ),
            onPressed: calculateBodyMass,
            child: const Text(
              'Calculate',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          if (result != null) ...[
            Text(
              'result: ${result!.toStringAsFixed(2)}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Shape: $shape',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ] else ...[
            const Text(
              'Enter valid values',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }
}
