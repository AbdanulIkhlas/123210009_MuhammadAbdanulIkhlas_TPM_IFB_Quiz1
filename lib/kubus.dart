import 'package:flutter/material.dart';

class Kubus extends StatefulWidget {
  const Kubus({Key? key});

  @override
  State<Kubus> createState() => _KubusState();
}

class _KubusState extends State<Kubus> {
  double sisi = 0.0;
  double volume = 0.0;
  double keliling = 0.0;

  void hitungVolume() {
    setState(() {
      volume = sisi * sisi * sisi;
    });
  }

  void hitungKeliling() {
    setState(() {
      keliling = 12 * sisi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aplikasi Perhitungan Kubus",
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "VOLUME",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.view_in_ar_outlined,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Panjang Sisi',
                    ),
                    onChanged: (value) {
                      setState(() {
                        sisi = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: (sisi == 0.0) ? null : hitungVolume,
                    child: Text(
                      'Hitung Volume',
                      style: TextStyle(
                        color: (sisi == 0.0) ? null : Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Volume: $volume',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "KELILING",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.view_in_ar_outlined,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: (sisi == 0.0) ? null : hitungKeliling,
                    child: Text(
                      'Hitung Keliling',
                      style: TextStyle(
                        color: (sisi == 0.0) ? null : Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }
}
