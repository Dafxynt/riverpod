import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_project/bangun_datar/providers/square_provider.dart';
import 'package:my_flutter_project/bangun_datar/widgets/my_textfield.dart';

class SquarePage extends ConsumerWidget {
  const SquarePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final squareState = ref.watch(squareProvider);

    final sideController = TextEditingController();

    void calculateSquare() {
      final side = double.tryParse(sideController.text) ?? 0;
      ref.read(squareProvider.notifier).calculate(side);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Persegi',
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
              label: 'Panjang Sisi',
              hintText: 'Masukan Panjang Sisi..',
              controller: sideController,
              keyboardType: TextInputType.number,
              icon: Icons.straighten,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSquare,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (squareState.area != null && squareState.perimeter != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Luas: ${squareState.area}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Keliling: ${squareState.perimeter}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
