import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_bmi/provider/bmi_provider.dart';


class BMIScreen extends ConsumerStatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends ConsumerState<BMIScreen> {
  bool _hasCalculated = false; 

  String getBMIStatus(double bmi) {
    if (bmi == 0) return "Enter valid height and weight";
    if (bmi < 18.5) return "Underweight";
    if (bmi >= 18.5 && bmi < 24.9) return "Normal weight";
    return "Overweight";
  }

  @override
  Widget build(BuildContext context) {
    final bmi = ref.read(bmiProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ref.read(heightProvider.notifier).state = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ref.read(weightProvider.notifier).state = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _hasCalculated = true;
                });
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 24),

            if (_hasCalculated) ...[
              Text(
                'Your BMI: ${bmi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(
                getBMIStatus(bmi),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: bmi >= 24.9 ? Colors.red : Colors.green,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
