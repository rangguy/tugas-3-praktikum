import 'package:flutter/material.dart';
import 'package:modul_3/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var namaUser;
  var passUser;

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', usernameController.text);
  }

  void _savePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', passwordController.text);
  }

  _showDialog(pesan, alamat) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(pesan),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => alamat),
                    );
                  },
                  child: const Text("Ok"))
            ],
          );
        }));
  }

  _inputan(namaController, placeholder, isPassword) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff475BD8)),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: namaController,
        decoration: InputDecoration.collapsed(hintText: placeholder),
        obscureText: isPassword,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _inputan(usernameController, 'Masukkan Username', false),
              const SizedBox(
                height: 15,
              ),
              _inputan(passwordController, 'Masukkan Password', true),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (usernameController.text == 'admin' &&
                      passwordController.text == 'admin') {
                    _saveUsername();
                    _savePassword();
                    _showDialog("Anda berhasil login", const HomePage());
                  } else {
                    _showDialog(
                        "Username dan Password Salah", const LoginPage());
                  }
                },
              ),
            ],
          ),
        ));
  }
}
