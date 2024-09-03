import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum untuk mendefinisikan jenis bangun ruang
enum JenisBangun { kubus, balok, prisma, tabung, kerucut, limas }

// State class untuk menyimpan jenis bangun dan dimensinya
class StateBangunRuang {
  final JenisBangun jenisBangun;
  final double dimensi1;
  final double dimensi2;
  final double dimensi3;

  StateBangunRuang({
    required this.jenisBangun,
    required this.dimensi1,
    required this.dimensi2,
    required this.dimensi3,
  });

  StateBangunRuang copyWith({
    JenisBangun? jenisBangun,
    double? dimensi1,
    double? dimensi2,
    double? dimensi3,
  }) {
    return StateBangunRuang(
      jenisBangun: jenisBangun ?? this.jenisBangun,
      dimensi1: dimensi1 ?? this.dimensi1,
      dimensi2: dimensi2 ?? this.dimensi2,
      dimensi3: dimensi3 ?? this.dimensi3,
    );
  }
}

// Provider untuk mengelola state bangun ruang
final bangunProvider = StateProvider<StateBangunRuang>((ref) {
  return StateBangunRuang(
    jenisBangun: JenisBangun.kubus,
    dimensi1: 0,
    dimensi2: 0,
    dimensi3: 0,
  );
});

// Provider untuk mengelola rute saat ini
final currentRouteProvider = StateProvider<String>((ref) => '/kalkulator');
