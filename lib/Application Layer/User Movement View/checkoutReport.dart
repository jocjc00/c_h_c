import 'package:c_h_c/Application%20Layer/User%20Movement%20View/addCheckout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../Services Layer/User Movement Controller/userMovement_bloc.dart';
import 'addCheckout.dart';
import '../../Application Layer/Actor View/userMenu.dart';
// import 'updateCheckIn.dart';

class CheckoutReport extends StatefulWidget {
  const CheckoutReport({Key? key}) : super(key: key);

  @override
  State<CheckoutReport> createState() => _CheckoutReportState();
}

class _CheckoutReportState extends State<CheckoutReport> {
  final UserMovementBloc userMovementBloc = UserMovementBloc();

  //get data when initial this state
  @override
  void initState() {
    userMovementBloc.add(GetUserList());
    super.initState();
  }

  refresh() {
    setState(() {
      initState();
    });
  }

  //refresh when pop
  onGoBack(dynamic value) {
    setState(() {
      initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
          title: const Text('Checkout Report'),
          backgroundColor: Colors.green[900],
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: const FractionalOffset(0.5, 0.3),
          children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
              child: ElevatedButton(
                style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.lightGreen)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserMenuPage()),
                  ).then(onGoBack);
                },
                child: const Text('Back to Homepage'),
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
              create: (_) => userMovementBloc,
              child:
                  BlocBuilder<UserMovementBloc, UserState>(builder: (context, state) {
                if (state is UserInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is IndexUserLoad) {
                  return _UI(
                      context, state.userMovementModel, onGoBack, refresh, userMovementBloc);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
        ),
      ),
    );
  }
}

//display list data
Widget _UI(BuildContext context, state, onGoBack, refresh, userMovementBloc) {
  return ListView.builder(
      itemCount: state == null ? 0 : state.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 2000),
              padding: const EdgeInsets.only(top: 20, bottom: 2),
              decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color.fromARGB(255, 57, 105, 33), width: 5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 57, 105, 33),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("CHECK OUT REPORT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                  child: Text("THANK YOU!",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 113, 204, 67),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(children: [
                                      const Text("Name: ",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 57, 105, 33),
                                              fontSize: 18)),
                                      Text(
                                        state[index].name.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                      
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 13),
                                child: Row(children: [
                                  const Text("Your Dependent: ",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 57, 105, 33),
                                          fontSize: 18)),
                                  Text(
                                    state[index].dependent.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ]),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Phone Number: ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 57, 105, 33),
                                            fontSize: 18)),
                                    Text(
                                      state[index].phoneNumber.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Email Address: ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 57, 105, 33),
                                            fontSize: 18)),
                                    Text(
                                      state[index].emailAddress.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: const [
                                    Text("Location: ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 57, 105, 33),
                                            fontSize: 18))
                                  ])),
                                  Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    Text(
                                      state[index].location.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Check Out Date: ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 57, 105, 33),
                                            fontSize: 18)),
                                    Text(
                                      state[index].date.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Row(children: [
                                    const Text("Check Out Time: ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 57, 105, 33),
                                            fontSize: 18)),
                                    Text(
                                      state[index].time.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Column(children: [
                                    const Text("Vaccination Status: ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 90, 94, 192),
                                            fontSize: 18)),
                                    Text(
                                      state[index].vaccStatus.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                    ),
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 13),
                                  child: Column(children: [
                                    const Text("Risk Status: ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 90, 94, 192),
                                            fontSize: 18)),
                                    Text(
                                      state[index].riskStatus.toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                    ),
                                  ])),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ));
      });
}