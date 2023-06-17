import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data Layer/Model/AdminMsgModel.dart';
import '../../Services Layer/Admin Msg Controller/adminMsg_bloc.dart';

class UpdateAdminMsgPage extends StatefulWidget {
  const UpdateAdminMsgPage({Key? key}) : super(key: key);

  @override
  State<UpdateAdminMsgPage> createState() => _UpdateAdminMsgPageState();
}

class _UpdateAdminMsgPageState extends State<UpdateAdminMsgPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _msg = TextEditingController();
  TextEditingController _zone = TextEditingController();
  TextEditingController _cluster = TextEditingController();
  final AdminMsgBloc adminMsgBloc = AdminMsgBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Update Notification Msg'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                adminMsgBloc.add(GetMsgData(id));
                return adminMsgBloc;
              },
              child: BlocBuilder<AdminMsgBloc, AdminMsgState>(
                builder: (context, state) {
                  if (state is AdminMsgInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AdminMsgLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateAdminMsgLoad) {
                    _msg.text = state.adminMsgModel.msg;
                    _zone.text = state.adminMsgModel.zone;
                    _cluster.text = state.adminMsgModel.cluster.toString();

                    return ListView(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          elevation: 10,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 1),
                          child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      controller: _msg,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter COVID19 Cluster Region',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _zone,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter COVID19 Cluster Zone',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _cluster,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Number of Reported Cases',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter number of cases';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          70, 30, 70, 10),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.lightGreen)),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            //add to model
                                            AdminMsgModel adminMsgModel =
                                                AdminMsgModel(
                                                    id: id,
                                                    msg: _msg.text,
                                                    zone: _zone.text,
                                                    cluster: int.parse(
                                                        _cluster.text));

                                            //update to bloc
                                            adminMsgBloc.add(UpdateAdminMsgData(
                                                adminMsgModel));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Data Added Successfully'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )),
    );
  }
}
