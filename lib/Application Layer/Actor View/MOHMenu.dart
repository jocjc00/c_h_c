import 'package:c_h_c/Application%20Layer/MOH%20Quarantine%20View/viewQuarantineDetails.dart';
import 'package:c_h_c/Application%20Layer/MOH%20Staff%20Vaccination%20View/indexVaccinationAvailability.dart';
import 'package:flutter/material.dart';

import '../../Application Layer/MOH Movement View/closeContactDetail.dart';

class MOHMenuPage extends StatelessWidget {
  const MOHMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          // ignore: prefer_const_constructors
          backgroundColor: Colors.green[900],
          title: const Text('MOH Staff Homepage'),
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
                      builder: (context) => const CloseContact()),
                );
              },
              child: const Text('Close Contact'),
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
                      builder: (context) => const IndexAdminPage()),
                );
              },
              child: const Text('Manage Vaccination Availability'),
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
                      builder: (context) => const viewQuarantineDetailsPage()),
                );
              },
              child: const Text('View Quarantine Details'),
            ),
          ),

          ],

  
),
      )
    );
  }
}