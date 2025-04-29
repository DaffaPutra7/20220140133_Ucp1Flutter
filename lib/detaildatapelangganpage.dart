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

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Provinsi', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        TextFormField(
                          initialValue: provinsi,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kode Pos', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        TextFormField(
                          initialValue: kodepos,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage(email: email))
                      );
                    }, 
                    child: Text('Selesai', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}