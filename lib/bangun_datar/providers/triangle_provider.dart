import 'package:flutter_riverpod/flutter_riverpod.dart';

class TriangleState {
  final double? area;

  TriangleState({this.area});
}

class TriangleNotifier extends StateNotifier<TriangleState> {
  TriangleNotifier() : super(TriangleState());

  void calculate(double base, double height) {
    state = TriangleState(
      area: 0.5 * base * height,
    );
  }
}

final triangleProvider = StateNotifierProvider<TriangleNotifier, TriangleState>((ref) => TriangleNotifier());
