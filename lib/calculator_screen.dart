import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class CalculatorScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final input1 = ref.watch(input1Provider);
    final input2 = ref.watch(input2Provider);
    final result = ref.watch(resultProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Aritmatika'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Angka Pertama',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ref.read(input1Provider.notifier).state =
                    double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Angka Kedua',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ref.read(input2Provider.notifier).state =
                    double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOperationButton(ref, '+', Operation.add),
                _buildOperationButton(ref, '-', Operation.subtract),
                _buildOperationButton(ref, '×', Operation.multiply),
                _buildOperationButton(ref, '÷', Operation.divide),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: ${result.isNaN ? 'Tidak Terdefinisi' : result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationButton(
      WidgetRef ref, String symbol, Operation operation) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(fontSize: 20, color: Colors.black),
        side: BorderSide(color: Colors.deepPurple, width: 2),
      ),
      onPressed: () => ref.read(operationProvider.notifier).state = operation,
      child: Text(symbol),
    );
  }
}
