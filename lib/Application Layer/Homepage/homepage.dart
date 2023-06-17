import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Actor View/AdminMenu.dart';
import '../Actor View/MOHMenu.dart';
import '../Actor View/userMenu.dart';

//create homepage for admin, MOH staff and user
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('CHC System Homepage'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightGreen)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserMenuPage()),
                );
              },
              child: const Text('User'),
            ),
          ),

          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightGreen)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MOHMenuPage()),
                );
              },
              child: const Text('MOH Staff'),
            ),
          ),

          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightGreen)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminMenuPage()),
                );
              },
              child: const Text('Admin'),
            ),
          ),

        ],
      ),
    );
  }
}
