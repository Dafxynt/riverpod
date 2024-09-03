import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParallelogramState {
  final double? area;

  ParallelogramState({this.area});
}

class ParallelogramNotifier extends StateNotifier<ParallelogramState> {
  ParallelogramNotifier() : super(ParallelogramState());

  void calculate(double base, double height) {
    state = ParallelogramState(
      area: base * height,
    );
  }
}

final parallelogramProvider = StateNotifierProvider<ParallelogramNotifier, ParallelogramState>((ref) => ParallelogramNotifier());
