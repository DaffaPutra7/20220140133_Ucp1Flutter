import 'package:flutter/material.dart';

class DetailDataPiketPage extends StatelessWidget {
  final String tanggal;
  final String tugas;
  final String email;
  const DetailDataPiketPage({
    super.key,
    required this.tanggal,
    required this.tugas,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('Detail $tugas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tanggal,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    email,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tugas,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}