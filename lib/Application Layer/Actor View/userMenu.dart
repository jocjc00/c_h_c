import 'package:c_h_c/Application%20Layer/User%20Movement%20View/movementHistory.dart';
import 'package:c_h_c/Application%20Layer/User%20Quarantine%20View/Index%20User.dart';
import 'package:c_h_c/Application%20Layer/profileInfo/userProfileView.dart';
import 'package:flutter/material.dart';

import '../../Application Layer/User Movement View/addCheckIn.dart';
import '../../Application Layer/User Info View/indexUserInfo.dart';
import '../../Application Layer/User Msg View/indexUserMsg.dart';
import '../User Vaccination View/indexVaccineApplication.dart';

class UserMenuPage extends StatelessWidget {
  const UserMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          // ignore: prefer_const_constructors
          backgroundColor: Colors.green[900],
          title: const Text('User Homepage'),
        ),
        body: ListView(
        children: [
          const SizedBox(height: 30,),

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
                      builder: (context) => const UserProfileView()),
                );
              },
              child: const Text('User Profile'),
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
                      builder: (context) => const AddCheckIn()),
                );
              },
              child: const Text('Check In'),
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
                      builder: (context) => const MovementHistory()),
                );
              },
              child: const Text('Movement History'),
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
                      builder: (context) => const IndexUserVaccPage()),
                );
              },
              child: const Text('Vaccine Application'),
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
                      builder: (context) => const IndexUserPage()),
                );
              },
              child: const Text('Manage Quarantine'),
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
                      builder: (context) => const IndexUserInfoPage()),
                );
              },
              child: const Text('View COVID19 Info'),
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
                      builder: (context) => const IndexUserMsgPage()),
                );
              },
              child: const Text('View Notification Message'),
            ),
          ),

          ], 
        ),
      )
    );
  }
}