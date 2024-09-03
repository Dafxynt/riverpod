import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'layar_kalkulator_bangun.dart';
import 'halaman_tentang.dart';

void main() {
  runApp(ProviderScope(child: KalkulatorBangunApp()));
}

// Provider untuk mengelola rute saat ini
final currentRouteProvider = StateProvider<String>((ref) => '/kalkulator');

class KalkulatorBangunApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = ref.watch(currentRouteProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Bangun Ruang',
      home: Navigator(
        pages: [
          if (currentRoute == '/kalkulator')
            MaterialPage(child: LayarKalkulatorBangun()),
          if (currentRoute == '/tentang') MaterialPage(child: HalamanTentang()),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          ref.read(currentRouteProvider.notifier).state = '/kalkulator';
          return true;
        },
      ),
    );
  }
}
