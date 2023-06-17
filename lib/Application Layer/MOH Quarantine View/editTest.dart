import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data Layer/Model/MOHQuarantineModel.dart';
import '../../Services Layer/MOH Quarantine Controller/MOHQuarantine_bloc.dart';


class UpdateAdminPage extends StatefulWidget {
  const UpdateAdminPage({Key? key}) : super(key: key);

  @override
  State<UpdateAdminPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateAdminPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _result = TextEditingController();
  TextEditingController _quarantineType = TextEditingController();
  final MOHQuarantineBloc adminBloc = MOHQuarantineBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Update Test Data'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                adminBloc.add(GetAdminData(id));
                return adminBloc;
              },
              child: BlocBuilder<MOHQuarantineBloc, MOHQuarantineState>(
                builder: (context, state) {
                  if (state is AdminInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AdminLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateAdminLoad) {
                    _name.text = state.adminModel.name;
                    _result.text = state.adminModel.result;

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
                                      controller: _name,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter your name',
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
                                      controller: _result,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Test Result',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter test result';
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
                                            MOHQuarantineModel
                                                mohQuarantineModel =
                                                MOHQuarantineModel(
                                                    id: id,
                                                    name: _name.text,
                                                    result: _result.text,
                                                    quarantineType:
                                                        _quarantineType.text);

                                            //update to bloc
                                            adminBloc.add(UpdateAdminData(
                                                mohQuarantineModel));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Data Added Successfully'),
                                                backgroundColor: Colors.blueAccent,
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
