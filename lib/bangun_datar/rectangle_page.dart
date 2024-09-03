import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_project/bangun_datar/providers/rectangle_provider.dart';
import 'package:my_flutter_project/bangun_datar/widgets/my_textfield.dart';

class RectanglePage extends ConsumerWidget {
  const RectanglePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rectangleState = ref.watch(rectangleProvider);

    final lengthController = TextEditingController();
    final widthController = TextEditingController();

    void calculateRectangle() {
      final length = double.tryParse(lengthController.text) ?? 0;
      final width = double.tryParse(widthController.text) ?? 0;
      ref.read(rectangleProvider.notifier).calculate(length, width);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Persegi Panjang',
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
              label: 'Panjang',
              hintText: 'Masukan Panjang..',
              controller: lengthController,
              keyboardType: TextInputType.number,
              icon: Icons.straighten,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: 'Lebar',
              hintText: 'Masukan Lebar..',
              controller: widthController,
              keyboardType: TextInputType.number,
              icon: Icons.straighten,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateRectangle,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (rectangleState.area != null)
              Text(
                'Luas: ${rectangleState.area}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
