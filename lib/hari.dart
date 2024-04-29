import 'package:flutter/material.dart';

class Hari extends StatefulWidget {
  @override
  _HariState createState() => _HariState();
}

class _HariState extends State<Hari> {
  int _input = 1;
  String _result = '';

  void _konversiHari() {
    if (_input >= 1 && _input <= 7) {
      switch (_input) {
        case 1:
          setState(() {
            _result = 'Senin';
          });
          break;
        case 2:
          setState(() {
            _result = 'Selasa';
          });
          break;
        case 3:
          setState(() {
            _result = 'Rabu';
          });
          break;
        case 4:
          setState(() {
            _result = 'Kamis';
          });
          break;
        case 5:
          setState(() {
            _result = 'Jumat';
          });
          break;
        case 6:
          setState(() {
            _result = 'Sabtu';
          });
          break;
        case 7:
          setState(() {
            _result = 'Minggu';
          });
          break;
        default:
          setState(() {
            _result = 'Tidak valid';
          });
      }
    } else {
      setState(() {
        _result = 'Input Angka 1-7!!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Konversi Hari",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.cyan.shade600,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan.shade400, Colors.cyan.shade200],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka 1-7',
              ),
              onChanged: (value) {
                int? parsedValue = int.tryParse(value);
                if (parsedValue != null) {
                  setState(() {
                    _input = parsedValue;
                    _result = 'Klik Check';
                  });
                } else {
                  setState(() {
                    _result = 'Input Angka 1-7!!';
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _konversiHari,
              child: Text(
                'Check',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                backgroundColor: Colors.cyan.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $_result',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
