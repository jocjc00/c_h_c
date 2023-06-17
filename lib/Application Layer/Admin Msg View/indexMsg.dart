import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Services Layer/Admin Msg Controller/adminMsg_bloc.dart';

import 'addMsg.dart';
import 'updateMsg.dart';

class IndexAdminMsgPage extends StatefulWidget {
  const IndexAdminMsgPage({Key? key}) : super(key: key);

  @override
  State<IndexAdminMsgPage> createState() => _IndexAdminMsgPageState();
}

class _IndexAdminMsgPageState extends State<IndexAdminMsgPage> {
  final AdminMsgBloc adminMsgBloc = AdminMsgBloc();

  //get data when initial this state
  @override
  void initState() {
    adminMsgBloc.add(GetMsgList());
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
          backgroundColor: Colors.green[900],
          title: const Text('Index Admin Msg Page'),
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: const FractionalOffset(1.0, 0.3),
          children: [
            Container(
              height: 40.0,
              color: Colors.white,
            ),
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
                        builder: (context) => const AddAdminMsgPage()),
                  ).then(onGoBack);
                },
                child: const Text('Add Notification Msg'),
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
              create: (_) => adminMsgBloc,
              child:
                  BlocBuilder<AdminMsgBloc, AdminMsgState>(builder: (context, state) {
                if (state is AdminMsgInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AdminMsgLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is IndexAdminMsgLoad) {
                  return _UI(
                      context, state.adminMsgModel, onGoBack, refresh, adminMsgBloc);
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
Widget _UI(BuildContext context, state, onGoBack, refresh, adminMsgBloc) {
  return ListView.builder(
      itemCount: state == null ? 0 : state.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
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
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  state[index].msg.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     IconButton(
                                       icon: const Icon(Icons.edit),
                                       onPressed: () {
                                         Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                                 builder: (context) => const UpdateAdminMsgPage(),
                                                 settings: RouteSettings(
                                                   arguments: {
                                                     "id": state[index].id.toString(),
                                                   },
                                                 ))).then(onGoBack);
                                       },
                                     ),
                                     IconButton(
                                       icon: const Icon(Icons.delete),
                                       onPressed: () {
                                         adminMsgBloc.add(DeleteAdminMsgData(state[index].id));
                                         refresh();
                                       },
                                     ),
                                   ],
                                 )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              state[index].zone.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              state[index].cluster.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
