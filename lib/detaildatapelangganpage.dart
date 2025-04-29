import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140133/homepage.dart';

class DetailDataPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String nohp;
  final String alamat;
  final String provinsi;
  final String kodepos;
  const DetailDataPelangganPage({
    required this.nama,
    required this.email,
    required this.nohp,
    required this.alamat,
    required this.provinsi,
    required this.kodepos,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Detail $nama',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/image/amazon.png'),
                backgroundColor: Colors.grey.shade300,
              ),
              SizedBox(height: 20),
              Text(nama, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(email),
              Text(nohp),
              SizedBox(height: 30),

              Align(alignment: Alignment.centerLeft, child: Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(height: 8),
              TextFormField(
                initialValue: alamat,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}