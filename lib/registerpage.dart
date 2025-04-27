import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140133/homepage.dart';
import 'package:ucp1flutter_20220140133/loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('DAFTAR AKUN BARU',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Text('Nama Lengkap',style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.all(5.0)),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outlined), 
                  hintText: 'Nama Lengkap', 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black))
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined), 
                            hintText: 'Email', 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text('Nomor HP', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: nohpController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone_outlined), 
                            hintText: 'No HP', 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          decoration:  InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined), 
                            hintText: 'Password', 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              }, 
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              ))
                            ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text('Konfirmasi Password', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: confirmpasswordController,
                          obscureText: _obscureConfirmPassword,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined), 
                            hintText: 'Konfirmasi Password', 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.black)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword = !_obscureConfirmPassword;
                                });
                              },
                              icon: Icon(
                                _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                              ))
                            ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your confirmation password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(15.0)),
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
                      if (_formKey.currentState!.validate()) {
                        if (passwordController.text != confirmpasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Password harus sama!'),
                              backgroundColor: Colors.orange, 
                            ),
                          );
                          return;
                        } else {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => HomePage(
                              email: emailController.text)
                            )
                          );
                        }
                      }
                    }, 
                    child: Text('Daftar', style: TextStyle(color: Colors.white),)
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah memiliki akun? Silahkan'),
                  SizedBox(width: 4),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    }, 
                  child: Text('Login Disini!', style: TextStyle(color: Colors.orange),))
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}