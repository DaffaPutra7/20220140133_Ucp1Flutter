import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailDataBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlah;
  final int harga;
  final int total;
  const DetailDataBarangPage({
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlah,
    required this.harga,
    required this.total,
    super.key
  });

  String formatRupiah(int angka) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0).format(angka);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF7F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green.shade100, width: 10),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 30,
                child: Icon(Icons.check, color: Colors.white, size: 40),
              ),
            ),
            SizedBox(height: 30),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  buildInfoRow('Tanggal', tanggal),
                  buildDivider(),
                  buildInfoRow('Jenis Transaksi', jenisTransaksi),
                  buildDivider(),
                  buildInfoRow('Jenis Barang', jenisBarang),
                  buildDivider(),
                  buildInfoRow('Jumlah Barang', jumlah.toString()),
                  buildDivider(),
                  buildInfoRow('Jenis Harga Satuan', formatRupiah(harga)),
                  buildDivider(),
                  buildInfoRow('Total Harga', formatRupiah(total)),
                  buildDivider(),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SizedBox(
                width: double.infinity,
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
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Selesai',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      height: 5,
      thickness: 1,
      color: Colors.black12,
    );
  }
}