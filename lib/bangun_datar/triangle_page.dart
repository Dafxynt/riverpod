import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_project/bangun_datar/providers/triangle_provider.dart';
import 'package:my_flutter_project/bangun_datar/widgets/my_textfield.dart';

class TrianglePage extends ConsumerWidget {
  const TrianglePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final triangleState = ref.watch(triangleProvider);

    final baseController = TextEditingController();
    final heightController = TextEditingController();

    void calculateTriangle() {
      final base = double.tryParse(baseController.text) ?? 0;
      final height = double.tryParse(heightController.text) ?? 0;
      ref.read(triangleProvider.notifier).calculate(base, height);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Segitiga',
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
              label: 'Alas',
              hintText: 'Masukan Alas..',
              controller: baseController,
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
              onPressed: calculateTriangle,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (triangleState.area != null)
              Text(
                'Luas: ${triangleState.area}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
