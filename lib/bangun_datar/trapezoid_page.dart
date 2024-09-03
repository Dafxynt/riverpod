import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_project/bangun_datar/providers/trapezoid_provider.dart';
import 'package:my_flutter_project/bangun_datar/widgets/my_textfield.dart';

class TrapezoidPage extends ConsumerWidget {
  const TrapezoidPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trapezoidState = ref.watch(trapezoidProvider);

    final topSideController = TextEditingController();
    final bottomSideController = TextEditingController();
    final heightController = TextEditingController();

    void calculateTrapezoid() {
      final topSide = double.tryParse(topSideController.text) ?? 0;
      final bottomSide = double.tryParse(bottomSideController.text) ?? 0;
      final height = double.tryParse(heightController.text) ?? 0;
      ref.read(trapezoidProvider.notifier).calculate(topSide, bottomSide, height);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trapesium',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 5, 4, 1),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(25, 28, 37, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: 'Sisi Atas',
              hintText: 'Masukan Sisi Atas..',
              controller: topSideController,
              keyboardType: TextInputType.number,
              icon: Icons.straighten,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: 'Sisi Bawah',
              hintText: 'Masukan Sisi Bawah..',
              controller: bottomSideController,
              keyboardType: TextInputType.number,
              icon: Icons.straighten,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: 'Tinggi',
              hintText: 'Masukan Tinggi..',
              controller: heightController,
              keyboardType: TextInputType.number,
              icon: Icons.straighten,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTrapezoid,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (trapezoidState.area != null)
              Text(
                'Luas: ${trapezoidState.area}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
