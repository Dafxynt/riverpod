import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugas_bdriverpod/widgets/my_textfield.dart';
import 'package:tugas_bdriverpod/providers/circle_provider.dart';

class CirclePage extends ConsumerWidget {
  const CirclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final circleState = ref.watch(circleProvider);

    final radiusController = TextEditingController();

    void calculateCircle() {
      final radius = double.tryParse(radiusController.text) ?? 0;
      ref.read(circleProvider.notifier).calculate(radius);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lingkaran',
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
              label: 'Jari-jari',
              hintText: 'Masukan Jari-jari..',
              controller: radiusController,
              keyboardType: TextInputType.number,
              icon: Icons.straighten,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateCircle,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (circleState.area != null)
              Text(
                'Luas: ${circleState.area}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
