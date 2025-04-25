import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140133/homepage.dart';
import 'package:ucp1flutter_20220140133/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              Text('SELAMAT DATANG KEMBALI',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text('Email'),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), 
                  hintText: 'Email', 
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Padding(padding: const EdgeInsets.all(10.0)),
              Text('Password'),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  hintText: 'Password',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                obscureText: true,
                validator:(value) {
                  if( value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  }
                }, 
                child: Text('Masuk')),
              Row(
                children: [
                  Text('Belum memiliki akun? Shilahkan'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => RegisterPage())
                      );
                  }, 
                  child: Text('Daftar Disini!'))
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}