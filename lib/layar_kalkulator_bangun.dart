import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'state_bangun_ruang.dart';
import 'kalkulator_bangun_ruang.dart';

class LayarKalkulatorBangun extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateBangun = ref.watch(bangunProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Bangun Ruang'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              ref.read(currentRouteProvider.notifier).state = '/tentang';
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Jenis Bangun Ruang:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 8.0,
                children: JenisBangun.values.map((JenisBangun jenis) {
                  return SizedBox(
                    width: 100, // Adjust width as needed
                    child: ChoiceChip(
                      label: Text(jenis.toString().split('.').last),
                      selected: stateBangun.jenisBangun == jenis,
                      onSelected: (selected) {
                        if (selected) {
                          ref.read(bangunProvider.notifier).state =
                              stateBangun.copyWith(jenisBangun: jenis);
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              if (stateBangun.jenisBangun == JenisBangun.kubus)
                KubusLayout()
              else
                BangunRuangLainLayout(stateBangun),
              SizedBox(height: 20),
              Text('Volume: ${KalkulatorBangunRuang.hitungVolume(stateBangun)}'),
              Text('Luas Permukaan: ${KalkulatorBangunRuang.hitungLuasPermukaan(stateBangun)}'),
            ],
          ),
        ),
      ),
    );
  }
}

class KubusLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: InputDecoration(labelText: 'Sisi Kubus'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        ref.read(bangunProvider.notifier).state =
            ref.read(bangunProvider).copyWith(dimensi1: double.tryParse(value) ?? 0);
      },
    );
  }
}

class BangunRuangLainLayout extends ConsumerWidget {
  final StateBangunRuang stateBangun;

  BangunRuangLainLayout(this.stateBangun);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Dimensi 1 (misal: Jari-jari atau Panjang)'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            ref.read(bangunProvider.notifier).state =
                stateBangun.copyWith(dimensi1: double.tryParse(value) ?? 0);
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Dimensi 2 (misal: Tinggi atau Lebar)'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            ref.read(bangunProvider.notifier).state =
                stateBangun.copyWith(dimensi2: double.tryParse(value) ?? 0);
          },
        ),
        if (stateBangun.jenisBangun == JenisBangun.balok ||
            stateBangun.jenisBangun == JenisBangun.prisma ||
            stateBangun.jenisBangun == JenisBangun.limas)
          TextField(
            decoration: InputDecoration(labelText: 'Dimensi 3 (misal: Kedalaman)'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              ref.read(bangunProvider.notifier).state =
                  stateBangun.copyWith(dimensi3: double.tryParse(value) ?? 0);
            },
          ),
      ],
    );
  }
}
