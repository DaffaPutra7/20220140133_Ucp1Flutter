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
    return const Placeholder();
  }
}