import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrapezoidState {
  final double? area;

  TrapezoidState({this.area});
}

class TrapezoidNotifier extends StateNotifier<TrapezoidState> {
  TrapezoidNotifier() : super(TrapezoidState());

  void calculate(double topSide, double bottomSide, double height) {
    state = TrapezoidState(
      area: 0.5 * (topSide + bottomSide) * height,
    );
  }
}

final trapezoidProvider =
    StateNotifierProvider<TrapezoidNotifier, TrapezoidState>(
        (ref) => TrapezoidNotifier());
