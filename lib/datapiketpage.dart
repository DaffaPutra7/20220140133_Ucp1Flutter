import 'package:flutter/material.dart';

class DataPiketPage extends StatefulWidget {
  final String email;
  const DataPiketPage({
    super.key,
    required this.email,
  });

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}