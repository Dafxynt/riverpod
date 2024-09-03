import 'package:flutter_riverpod/flutter_riverpod.dart';

class SquareState {
  final double? area;
  final double? perimeter;

  SquareState({this.area, this.perimeter});
}

class SquareNotifier extends StateNotifier<SquareState> {
  SquareNotifier() : super(SquareState());

  void calculate(double side) {
    state = SquareState(
      area: side * side,
      perimeter: 4 * side,
    );
  }
}

final squareProvider = StateNotifierProvider<SquareNotifier, SquareState>(
    (ref) => SquareNotifier());
