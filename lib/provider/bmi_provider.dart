import 'package:flutter_riverpod/flutter_riverpod.dart';


final heightProvider = StateProvider<double>((ref) => 0);
final weightProvider = StateProvider<double>((ref) => 0);

final bmiProvider = Provider<double>((ref) {
  final heightCm = ref.watch(heightProvider);
  final weight = ref.watch(weightProvider);

  final meter = heightCm / 100;

  if (meter > 0 && weight > 0) {
    return weight / (meter * meter);
  }
  return 0;
});

