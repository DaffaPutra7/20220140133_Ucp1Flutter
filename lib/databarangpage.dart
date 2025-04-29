import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1flutter_20220140133/detaildatabarangpage.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  String? selectedJenisTransaksi;
  String? selectedJenisBarang;

  final List<String> jenisTransaksi = ['Barang Masuk', 'Barang Keluar'];
  final List<String> jenisBarang = ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];

  final Map<String, int> hargaBarang = {
    'Carrier': 540000,
    'Sleeping Bag': 250000,
    'Tenda': 700000,
    'Sepatu': 350000,
  };

  Future<void> _selectTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, 
              onPrimary: Colors.white, 
              onSurface: Colors.black
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
              ),
            ),
          ), 
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _jumlahController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Pendataan Barang', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Tanggal Transaksi', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextFormField(
                controller: _tanggalController,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_today),
                  hintText: 'Tanggal Transaksi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.orange)
                  )
                ),
                onTap: () => _selectTanggal(context),
                validator:(value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: selectedJenisTransaksi,
                decoration: InputDecoration(
                  hintText: 'Jenis Transaksi',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                ),
                items: jenisTransaksi.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedJenisTransaksi = value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih jenis transaksi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: selectedJenisBarang,
                decoration: InputDecoration(
                  hintText: 'Jenis Barang',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.orange)
                  )
                ),
                items: jenisBarang.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedJenisBarang = value;
                    _hargaController.text = value != null ? hargaBarang[value]!.toString() : '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih jenis barang';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jumlah Barang', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _jumlahController,
                          decoration: InputDecoration(
                            hintText: 'Jumlah Barang',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.orange)
                            )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harga Satuan', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _hargaController,
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixText: 'Rp. ',
                            hintText: 'Harga Satuan',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.orange)
                            )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih jenis barang';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              SizedBox(
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
                    if (_formKey.currentState!.validate()) {
                      int jumlah = int.parse(_jumlahController.text);
                      int harga = int.parse(_hargaController.text);
                      int totalHarga = jumlah * harga;
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDataBarangPage(
                          tanggal: _tanggalController.text,
                          jenisTransaksi: selectedJenisTransaksi!,
                          jenisBarang: selectedJenisBarang!,
                          jumlah: jumlah,
                          harga: harga,
                          total: totalHarga,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}