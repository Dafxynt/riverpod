import 'package:flutter_riverpod/flutter_riverpod.dart';

class CircleState {
  final double? area;

  CircleState({this.area});
}

class CircleNotifier extends StateNotifier<CircleState> {
  CircleNotifier() : super(CircleState());

  void calculate(double radius) {
    state = CircleState(
      area: 3.14159 * radius * radius,
    );
  }
}

final circleProvider = StateNotifierProvider<CircleNotifier, CircleState>((ref) => CircleNotifier());
