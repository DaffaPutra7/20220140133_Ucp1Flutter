import 'package:flutter/material.dart';
import 'package:ucp1flutter_20220140133/homepage.dart';
import 'package:ucp1flutter_20220140133/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Center(
                child: Image.asset(
                  'assets/image/strava.png',
                  height: 100,
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Center(
                child: Text('SELAMAT DATANG KEMBALI',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Text('Email'),
              Padding(padding: EdgeInsets.all(5.0)),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), 
                  hintText: 'Email', 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Padding(padding: const EdgeInsets.all(10.0)),
              Text('Password',style: TextStyle(fontWeight: FontWeight.w500)),
              Padding(padding: EdgeInsets.all(5.0)),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    }, 
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    )
                  )
                ),
                obscureText: _obscurePassword,
                validator:(value) {
                  if( value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Center(
                child: SizedBox(
                  width: 500,
                  height: 50,
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage(
                          email: emailController.text,
                        )
                      ),
                    );
                  }
                }, 
                child: Text('Masuk', style: TextStyle(color: Colors.white),)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum memiliki akun? Silahkan'),
                  SizedBox(width: 4),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => RegisterPage())
                      );
                  }, 
                  child: Text('Daftar Disini!', style: TextStyle(color: Colors.orange),))
                ],
              ),
            ],
          ),
        )
      ),
      ),
    );
  }
}