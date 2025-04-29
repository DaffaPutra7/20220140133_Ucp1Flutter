import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140133/detaildatapiketpage.dart';

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
      resizeToAvoidBottomInset: false,
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
              Text('Nama Anggota', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
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
              Text('Pilih Tanggal', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
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
              Text('Tugas Piket', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _tugasController,
                      decoration: InputDecoration(
                        hintText: 'Tugas Piket',
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
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: ElevatedButton(
                      onPressed: _tambahTugas,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ), 
                      child: Text('Tambah', style: TextStyle(color: Colors.white)),
                    ),
                    )
                  )
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text('Daftar Tugas Piket',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 10),
              Expanded(
                child: daftarTugas.isEmpty
                  ? const Center(child: Text('Belum ada Data'))
                  : ListView.builder(
                    itemCount: daftarTugas.length,
                    itemBuilder: (context, index) {
                      final data = daftarTugas[index];
                      return Card(
                        color: Colors.orange,
                        child: ListTile(
                          title: Text(
                            data['tugas']!,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(Icons.arrow_forward, color: Colors.white),
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => DetailDataPiketPage(
                                  tanggal: data['tanggal']!,
                                  tugas: data['tugas']!,
                                  email: widget.email,
                                )
                              )
                            );
                          },
                        ),
                      );
                    }
                  )
                )
                ],
              ),
          ),
        ), 
      );
  }
}