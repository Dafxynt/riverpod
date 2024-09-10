import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screen/bmi_screen.dart';
import 'navigator/navigation_notifier.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationState = ref.watch(navigationProvider);

    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Navigator(
        pages: [
          MaterialPage(child: HomeScreen()),
          if (navigationState.currentPage == '/second')
            MaterialPage(child: BMIScreen()),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          ref.read(navigationProvider.notifier).navigateTo('/');
          return true;
        },
      ),
    );
  }
}
