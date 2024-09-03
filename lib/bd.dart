import 'package:flutter/material.dart';
import 'package:tugas_bdriverpod/widgets/my_outlinebutton.dart';
import 'square_page.dart'; // Impor halaman yang baru dibuat
import 'rectangle_page.dart';
import 'circle_page.dart';
import 'triangle_page.dart';
import 'trapezoid_page.dart';
import 'parallelogram_page.dart';

class BangunDatar extends StatefulWidget {
  const BangunDatar({super.key});

  @override
  State<BangunDatar> createState() => _BangunDatarState();
}

class _BangunDatarState extends State<BangunDatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bangun Datar',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 4, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(25, 28, 37, 1),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomOutlineButton(
                    text: 'Persegi',
                    textColor: Colors.white,
                    borderColor: Colors.white,
                    width: 250,
                    height: 50,
                    borderRadius: 25,
                    fontSize: 12,
                    OutlineWidth: 0.5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SquarePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButton(
                    text: 'Persegi Panjang',
                    textColor: Colors.white,
                    borderColor: Colors.white,
                    width: 250,
                    height: 50,
                    borderRadius: 25,
                    fontSize: 12,
                    OutlineWidth: 0.5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RectanglePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButton(
                    text: 'Lingkaran',
                    textColor: Colors.white,
                    borderColor: Colors.white,
                    width: 250,
                    height: 50,
                    borderRadius: 25,
                    fontSize: 12,
                    OutlineWidth: 0.5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CirclePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButton(
                    text: 'Segitiga',
                    textColor: Colors.white,
                    borderColor: Colors.white,
                    width: 250,
                    height: 50,
                    borderRadius: 25,
                    fontSize: 12,
                    OutlineWidth: 0.5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrianglePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButton(
                    text: 'Trapesium',
                    textColor: Colors.white,
                    borderColor: Colors.white,
                    width: 250,
                    height: 50,
                    borderRadius: 25,
                    fontSize: 12,
                    OutlineWidth: 0.5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrapezoidPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButton(
                    text: 'Jajar Genjang',
                    textColor: Colors.white,
                    borderColor: Colors.white,
                    width: 250,
                    height: 50,
                    borderRadius: 25,
                    fontSize: 12,
                    OutlineWidth: 0.5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ParallelogramPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
