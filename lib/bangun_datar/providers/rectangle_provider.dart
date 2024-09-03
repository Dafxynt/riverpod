import 'package:flutter_riverpod/flutter_riverpod.dart';

class RectangleState {
  final double? area;

  RectangleState({this.area});
}

class RectangleNotifier extends StateNotifier<RectangleState> {
  RectangleNotifier() : super(RectangleState());

  void calculate(double length, double width) {
    state = RectangleState(
      area: length * width,
    );
  }
}

final rectangleProvider = StateNotifierProvider<RectangleNotifier, RectangleState>((ref) => RectangleNotifier());
