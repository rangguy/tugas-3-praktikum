import 'package:flutter/material.dart';
import 'package:modul_3/Homepage.dart';
import 'package:modul_3/aboutpage.dart';
import 'package:modul_3/loginpage.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text("Sidemenu")),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const AboutPage())));
            },
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              })
        ],
      ),
    );
  }
}
