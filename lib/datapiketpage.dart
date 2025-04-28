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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();

  List<Map<String, String>> daftarTugas = [];
  String? _tanggalError;

  Future<void> _pilihTanggal() async {
    DateTime? pickedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
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
    if (pickedDate != null) {
      String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      setState(() {
        _tanggalController.text = formattedDate;
        _tanggalError = null;
      });
    }
  }

  void _tambahTugas() {
    setState(() {
      if (_tanggalController.text.isEmpty) {
        _tanggalError = "Tanggal tidak boleh kosong";
      } else {
        _tanggalError = null;
      }
    });

    if (_formKey.currentState!.validate() && _tanggalError == null) {
      setState(() {
        daftarTugas.add({
          'tugas': _tugasController.text,
          'tanggal': _tanggalController.text,
        });
        _tugasController.clear();
        _tanggalController.clear();
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piket Gudang', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Anggota'),
              SizedBox(height: 5),
              TextFormField(
                initialValue: widget.email,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Pilih Tanggal'),
              SizedBox(height: 5),
              TextFormField(
                controller: _tanggalController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Pilih Tanggal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                  errorText: _tanggalError,
                ),
                readOnly: true,
                onTap: _pilihTanggal,
              ),
              SizedBox(height: 20),
              Text('Tugas Piket'),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _tugasController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Tugas',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orange)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orange)
                        )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tugas tidak boleh kosong';
                        }
                        return null;
                      },
                    ), 
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _tambahTugas,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ), 
                    child: Text('Tambah', style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ],
          ),
        ), 
      ),
    );
  }
}