import 'package:flutter/material.dart';

class Trapesium extends StatefulWidget {
  const Trapesium({Key? key});

  @override
  State<Trapesium> createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  double alas = 0.0;
  double tinggi = 0.0;
  double sisiAtas = 0.0;
  double sisiMiring1 = 0.0;
  double sisiMiring2 = 0.0;
  double luas = 0.0;
  double keliling = 0.0;

  void hitungLuas() {
    if (alas == 0.0 || sisiAtas == 0.0 || tinggi == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap isi semua nilai (Alas, Sisi Atas, dan Tinggi)'),
        ),
      );
    } else {
      setState(() {
        luas = 0.5 * (alas + sisiAtas) * tinggi;
      });
    }
  }

  void hitungKeliling() {
    if (alas == 0.0 ||
        sisiAtas == 0.0 ||
        sisiMiring1 == 0.0 ||
        sisiMiring2 == 0.0 ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Harap isi semua nilai (Alas, Sisi Atas, Sisi Miring 1, dan Sisi Miring 2)'),
        ),
      );
    } else {
      setState(() {
        keliling = alas + sisiAtas + sisiMiring1 + sisiMiring2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aplikasi Penghitung Trapesium",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan.shade400, Colors.cyan.shade200],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // Expanded untuk tetapkan agar memenuhi ruang kosong
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "Menghitung Luas Dan Keliling Trapesium",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Alas',
                      ),
                      onChanged: (value) {
                        setState(() {
                          alas = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Sisi Atas',
                      ),
                      onChanged: (value) {
                        setState(() {
                          sisiAtas = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Sisi Miring 1',
                      ),
                      onChanged: (value) {
                        setState(() {
                          sisiMiring1 = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Sisi Miring 2',
                      ),
                      onChanged: (value) {
                        setState(() {
                          sisiMiring2 = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Tinggi',
                      ),
                      onChanged: (value) {
                        setState(() {
                          tinggi = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: (alas == 0.0 ||
                                      sisiAtas == 0.0 ||
                                      tinggi == 0.0)
                                  ? null
                                  : hitungLuas,
                              child: Text(
                                'Hitung Luas',
                                style: TextStyle(
                                  color: (alas == 0.0 ||
                                          sisiAtas == 0.0 ||
                                          tinggi == 0.0)
                                      ? null
                                      : Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Luas: $luas',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: (alas == 0.0 ||
                                      sisiAtas == 0.0 ||
                                      sisiMiring1 == 0.0 ||
                                      sisiMiring2 == 0.0)
                                  ? null
                                  : hitungKeliling,
                              child: Text(
                                'Hitung Keliling',
                                style: TextStyle(
                                  color: (alas == 0.0 ||
                                          sisiAtas == 0.0 ||
                                          sisiMiring1 == 0.0 ||
                                          sisiMiring2 == 0.0)
                                      ? null
                                      : Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Keliling: $keliling',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
