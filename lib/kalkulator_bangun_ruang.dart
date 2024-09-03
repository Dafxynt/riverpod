import 'state_bangun_ruang.dart';
import 'dart:math';

class KalkulatorBangunRuang {
  static double hitungVolume(StateBangunRuang state) {
    switch (state.jenisBangun) {
      case JenisBangun.kubus:
        return pow(state.dimensi1, 3).toDouble();
      case JenisBangun.balok:
        return state.dimensi1 * state.dimensi2 * state.dimensi3;
      case JenisBangun.prisma:
        return state.dimensi1 * state.dimensi2 * state.dimensi3;
      case JenisBangun.tabung:
        return (pi * pow(state.dimensi1, 2) * state.dimensi2).toDouble();
      case JenisBangun.kerucut:
        return ((1 / 3) * pi * pow(state.dimensi1, 2) * state.dimensi2).toDouble();
      case JenisBangun.limas:
        return ((1 / 3) * state.dimensi1 * state.dimensi2 * state.dimensi3).toDouble();
      default:
        return 0;
    }
  }

  static double hitungLuasPermukaan(StateBangunRuang state) {
    switch (state.jenisBangun) {
      case JenisBangun.kubus:
        return (6 * pow(state.dimensi1, 2)).toDouble();
      case JenisBangun.balok:
        return (2 * (state.dimensi1 * state.dimensi2 + state.dimensi2 * state.dimensi3 + state.dimensi1 * state.dimensi3)).toDouble();
      case JenisBangun.prisma:
        return (2 * state.dimensi1 * state.dimensi2 + state.dimensi3 * (state.dimensi1 + state.dimensi2)).toDouble();
      case JenisBangun.tabung:
        return (2 * pi * state.dimensi1 * (state.dimensi1 + state.dimensi2)).toDouble();
      case JenisBangun.kerucut:
        final s = sqrt(pow(state.dimensi1, 2) + pow(state.dimensi2, 2));
        return (pi * state.dimensi1 * (state.dimensi1 + s)).toDouble();
      case JenisBangun.limas:
        return state.dimensi1 * state.dimensi2;
      default:
        return 0;
    }
  }
}
