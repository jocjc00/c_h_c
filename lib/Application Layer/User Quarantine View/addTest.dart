import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data Layer/Model/UserQuarantineModel.dart';
import '../../Services Layer/User Quarantine Controller/UserQuarantine_bloc.dart';


//add self test result
class AddTestPage extends StatelessWidget {
  const AddTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _location = TextEditingController();
    TextEditingController _date = TextEditingController();
    TextEditingController _result = TextEditingController();
    TextEditingController _address = TextEditingController();
    final UserQuarantineBloc userBloc = UserQuarantineBloc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Text('Add Test Result'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
            create: (_) => userBloc,
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
                                //input name
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
                                //input age
                                controller: _age,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter age',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a age';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                //input location test taken
                                controller: _location,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Where the test is done?',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a place';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                //input date test taken
                                controller: _date,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'When was the test taken?',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid date';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                //input test result
                                controller: _result,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter Test Outcome',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid result';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                //input current address
                                controller: _address,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter Current Address',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid address';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 25,
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
                                      UserQuarantineModel userModel =
                                          UserQuarantineModel(
                                              name: _name.text,
                                              age: int.parse(_age.text),
                                              location: _location.text,
                                              date: _date.text,
                                              result: _result.text,
                                              address: _address.text);

                                      //add to bloc
                                      userBloc.add(InsertUserData(userModel));

                                      ScaffoldMessenger.of(
                                              context) //pop-up message indicate succesful added data
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Data Added Successfully!'),
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