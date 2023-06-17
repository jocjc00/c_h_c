import 'package:flutter/material.dart';

import '../Admin Info View/addInfo.dart';
import '../Admin Msg View/addMsg.dart';

class AdminMenuPage extends StatelessWidget {
  const AdminMenuPage({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Admin Homepage'),
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
                  MaterialPageRoute(
                      builder: (context) => const AddAdminInfoPage()),
                );
              },
              child: const Text('Manage COVID19 Info'),
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
                      builder: (context) => const AddAdminMsgPage()),
                );
              },
              child: const Text('Manage Notification Message'),
            ),
          ),
        ],
      ),
    );
  }
}