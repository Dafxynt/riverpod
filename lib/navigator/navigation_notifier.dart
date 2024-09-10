
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navigation_state.dart';

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(NavigationState('/'));

  void navigateTo(String page) {
    state = NavigationState(page);
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationState>(
        (ref) => NavigationNotifier());
