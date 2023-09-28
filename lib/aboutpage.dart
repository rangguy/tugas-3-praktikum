import 'package:flutter/material.dart';
import 'package:modul_3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var namaUser;
  var passUser;

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namaUser = prefs.getString('username');
    setState(() {});
  }

  void _loadPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    passUser = prefs.getString('password');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    _loadPassword();
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_box_rounded),
            title: Text("$namaUser"),
          ),
          ListTile(
            leading: Icon(Icons.security_rounded),
            title: Text("$passUser"),
          ),
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}
