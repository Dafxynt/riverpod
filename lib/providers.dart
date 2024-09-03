import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum untuk operasi aritmatika
enum Operation { add, subtract, multiply, divide }

// Provider untuk menyimpan operasi yang dipilih
final operationProvider = StateProvider<Operation>((ref) => Operation.add);

// Provider untuk menyimpan nilai input pertama
final input1Provider = StateProvider<double>((ref) => 0.0);

// Provider untuk menyimpan nilai input kedua
final input2Provider = StateProvider<double>((ref) => 0.0);

// Provider untuk menghitung hasil berdasarkan operasi yang dipilih
final resultProvider = Provider<double>((ref) {
  final operation = ref.watch(operationProvider);
  final input1 = ref.watch(input1Provider);
  final input2 = ref.watch(input2Provider);

  switch (operation) {
    case Operation.add:
      return input1 + input2;
    case Operation.subtract:
      return input1 - input2;
    case Operation.multiply:
      return input1 * input2;
    case Operation.divide:
      return input2 != 0 ? input1 / input2 : double.nan;
    default:
      return 0.0;
  }
});
