import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugas_bdriverpod/widgets/my_textfield.dart';
import 'package:tugas_bdriverpod/providers/parallelogram_provider.dart';

class ParallelogramPage extends ConsumerWidget {
  const ParallelogramPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parallelogramState = ref.watch(parallelogramProvider);

    final baseController = TextEditingController();
    final heightController = TextEditingController();

    void calculateParallelogram() {
      final base = double.tryParse(baseController.text) ?? 0;
      final height = double.tryParse(heightController.text) ?? 0;
      ref.read(parallelogramProvider.notifier).calculate(base, height);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jajaran Genjang',
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
              onPressed: calculateParallelogram,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (parallelogramState.area != null)
              Text(
                'Luas: ${parallelogramState.area}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
