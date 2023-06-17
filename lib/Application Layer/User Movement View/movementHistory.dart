import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../Services Layer/User Movement Controller/userMovement_bloc.dart';
import 'addCheckIn.dart';
// import 'updateCheckIn.dart';

class MovementHistory extends StatefulWidget {
  const MovementHistory({Key? key}) : super(key: key);

  @override
  State<MovementHistory> createState() => _MovementHistoryState();
}

class _MovementHistoryState extends State<MovementHistory> {
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
          
          title: const Text('Movement History'),
          backgroundColor: Colors.green[900],
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
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(top: 20, bottom: 2),
              decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color.fromARGB(255, 57, 105, 33), width: 5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 93, 170, 54),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(children: const [
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
                                    const Text("Date: ",
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
                                    const Text("Time: ",
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