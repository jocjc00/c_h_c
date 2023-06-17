import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data Layer/Model/AdminInfoModel.dart';
import '../../Services Layer/Admin Info Controller/adminInfo_bloc.dart';

class UpdateAdminInfoPage extends StatefulWidget {
  const UpdateAdminInfoPage({Key? key}) : super(key: key);

  @override
  State<UpdateAdminInfoPage> createState() => _UpdateAdminInfoPageState();
}

class _UpdateAdminInfoPageState extends State<UpdateAdminInfoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _info = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _cases = TextEditingController();
  TextEditingController _ttlCases = TextEditingController();
  TextEditingController _rec = TextEditingController();
  TextEditingController _fVac = TextEditingController();
  TextEditingController _doseAdm = TextEditingController();
  final AdminInfoBloc adminInfoBloc = AdminInfoBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Update Admin Info Data'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                adminInfoBloc.add(GetAdminData(id));
                return adminInfoBloc;
              },
              child: BlocBuilder<AdminInfoBloc, AdminInfoState>(
                builder: (context, state) {
                  if (state is AdminInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AdminLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateAdminLoad) {
                    _info.text = state.adminInfoModel.info;
                    _desc.text = state.adminInfoModel.desc;
                    _cases.text = state.adminInfoModel.cases.toString();
                    _ttlCases.text = state.adminInfoModel.ttlCases.toString();
                    _rec.text = state.adminInfoModel.rec.toString();
                    _fVac.text = state.adminInfoModel.fVac.toString();
                    _doseAdm.text = state.adminInfoModel.doseAdm.toString();

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
                                      controller: _info,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter COVID19 Info Title',
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
                                      controller: _desc,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter COVID19 Info Description',
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
                                      controller: _cases,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Number of COVID19 New Cases',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter number of new cases';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _ttlCases,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Number of COVID19 Total Cases',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter number of total cases';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _rec,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Number of COVID19 Recoveries',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter number of recoveries';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _fVac,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Number of Fully Vaccinated',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter number of fully vaccinated';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _doseAdm,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter Number of Dose Administered',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter number of dose administered';
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
                                            AdminInfoModel adminInfoModel =
                                                AdminInfoModel(
                                                    info: _info.text,
                                                    desc: _desc.text,
                                                    cases:
                                                        int.parse(_cases.text),
                                                    ttlCases: int.parse(
                                                        _ttlCases.text),
                                                    rec: int.parse(_rec.text),
                                                    fVac: int.parse(_fVac.text),
                                                    doseAdm: int.parse(
                                                        _doseAdm.text));

                                            //update to bloc
                                            adminInfoBloc.add(UpdateAdminData(
                                                adminInfoModel));

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
