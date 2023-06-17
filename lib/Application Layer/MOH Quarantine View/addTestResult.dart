import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data Layer/Model/MOHQuarantineModel.dart';
import '../../Services Layer/MOH Quarantine Controller/MOHQuarantine_bloc.dart';


class AddTestResultPage extends StatelessWidget {
  const AddTestResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _result = TextEditingController();
    TextEditingController _quarantineType = TextEditingController();
    final MOHQuarantineBloc adminBloc = MOHQuarantineBloc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Text('Update User Test Result'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
            create: (_) => adminBloc,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Card(
                    elevation: 10,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _name,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter user ID',
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
                                    return 'Please enter valid result';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _quarantineType,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter quarantine type:',
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
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(70, 30, 70, 10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.lightGreen)),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      //add to model
                                      MOHQuarantineModel userModel =
                                          MOHQuarantineModel(
                                              name: _name.text,
                                              result: _result.text,
                                              quarantineType:
                                                  _quarantineType.text);

                                      //add to bloc
                                      adminBloc.add(InsertAdminData(userModel));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Data Added Successfully'),
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
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
