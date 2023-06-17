import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data Layer/Model/MOHVaccinationModel.dart';
import '../../Services Layer/MOH Vaccination Controller/MOHVaccStatus_bloc.dart';

class UpdateAdminPage extends StatefulWidget {
  const UpdateAdminPage({Key? key}) : super(key: key);

  @override
  State<UpdateAdminPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateAdminPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dosenum = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _time = TextEditingController();
  TextEditingController _venue = TextEditingController();
  final AdminBloc adminBloc = AdminBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Update Vaccination Availability'),
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
              child: BlocBuilder<AdminBloc, AdminState>(
                builder: (context, state) {
                  if (state is AdminInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AdminLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateAdminLoad) {
                    _dosenum.text = state.adminVacModel.dosenum.toString();
                    _date.text = state.adminVacModel.date;
                    _time.text = state.adminVacModel.time;
                    _venue.text = state.adminVacModel.venue;

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
                                      controller: _dosenum,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter applicant dose number',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the applicant dose number!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _date,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter the date for the applicant',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the date!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _time,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter the time for the applicant',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the time!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _venue,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter the venue for the applicant',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the venue!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
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
                                            AdminVacModel adminVacModel =
                                                AdminVacModel(
                                              id: id,
                                              dosenum: int.parse(_dosenum.text),
                                              date: _date.text,
                                              time: _time.text,
                                              venue: _venue.text,
                                            );

                                            //update to bloc
                                            adminBloc.add(
                                                UpdateAdminData(adminVacModel));

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
