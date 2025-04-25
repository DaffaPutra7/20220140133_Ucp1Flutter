import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DAFTAR AKUN BARU',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
               Text('Nama Lengkap'),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outlined), 
                  hintText: 'Nama Lengkap', 
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
             
              Row(
                children: [
                  Expanded(child: ListTile(
                    title: Text('Nama'),
                    subtitle: TextFormField(
                      controller: namaController,
                        decoration: const InputDecoration(
                         prefixIcon: Icon(Icons.email_outlined), 
                         hintText: 'Nama Lengkap', 
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                        ),
                        validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter your name';
                          }
                          return null;
                        },
                    ),
                  ),),
                  SizedBox(width: 5,),
                  Expanded(child: ListTile(
                    title: Text('Nomor HP'),
                    subtitle: TextFormField(
                      controller: nohpController,
                        decoration: const InputDecoration(
                         prefixIcon: Icon(Icons.phone_outlined), 
                         hintText: 'No HP', 
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                        ),
                        validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter your number';
                          }
                          return null;
                        },
                    ),
                  ),),
                ],
              ),

              Row(
                children: [
                  Expanded(child: ListTile(
                    title: Text('Password'),
                    subtitle: TextFormField(
                      controller: passwordController,
                        decoration: const InputDecoration(
                         prefixIcon: Icon(Icons.key_outlined), 
                         hintText: 'Password', 
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                        ),
                        validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter your password';
                          }
                          return null;
                        },
                    ),
                  ),),
                  SizedBox(width: 5,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}