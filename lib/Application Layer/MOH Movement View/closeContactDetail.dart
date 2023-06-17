import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      // title: 'Kindacode.com',
      home: CloseContact(),
    );
  }
}

class CloseContact extends StatefulWidget {
  const CloseContact({Key? key}) : super(key: key);

  @override
  _CloseContactState createState() => _CloseContactState();
}

class _CloseContactState extends State<CloseContact> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "location": "Texas Chicken Aman Central", "name": "Alex Tan", "phoneNum": "0174567356"},
    {"id": 2, "location": "Brands Outlet Aman Central", "name": "Gogulan", "phoneNum": "0125472830"},
    {"id": 3, "location": "HM Aman Central", "name": "Nur Shahirah", "phoneNum": "0172341574"},
    {"id": 4, "location": "Cafe Diem Alor Setar", "name": "Carol Lim", "phoneNum": "0198837435"},
    {"id": 5, "location": "KFC Jalan Alor Mengkudu", "name": "Kamal Bin Ali", "phoneNum": "0183432166"},
    {"id": 6, "location": "Cafe Diem Alor Setar", "name": "Goi Wai Kit", "phoneNum": "0141321313"},
    {"id": 7, "location": "Texas Chicken Aman Central ", "name": "Siti Aisyah", "phoneNum": "0172263730"},
    {"id": 8, "location": "Eco Save Alor Setar", "name": "Sarah Alia", "phoneNum": "0164078345"},
    {"id": 9, "location": "Subway Jalan Pegawai", "name": "Ahmad Bin Abu", "phoneNum": "0173426709"},
    {"id": 10, "location": "MCD Aman Central", "name": "Celine Ong", "phoneNum": "0145531314"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["location"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Close Contact Page'),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search location', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded( 
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundUsers[index]['location']),
                          subtitle: Text(
                              'Name: ${_foundUsers[index]["name"].toString()}'),
                          trailing: Text(
                            _foundUsers[index]['phoneNum']),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}