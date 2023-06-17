import 'package:c_h_c/Application%20Layer/User%20Movement%20View/checkInReport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data Layer/Model/UserMovementModel.dart';
import '../../Services Layer/User Movement Controller/userMovement_bloc.dart';


class AddCheckIn extends StatelessWidget {
  const AddCheckIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _dependent = TextEditingController();
    TextEditingController _phoneNumber = TextEditingController();
    TextEditingController _emailAddress = TextEditingController();
    TextEditingController _location = TextEditingController();
    TextEditingController _date = TextEditingController();
    TextEditingController _time = TextEditingController();
    TextEditingController _vaccStatus = TextEditingController();
    TextEditingController _riskStatus = TextEditingController();
    final UserMovementBloc userMovementBloc = UserMovementBloc();

    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          
          backgroundColor: Colors.green[900],
          title: const Text('Check In Page'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
              create: (_) => userMovementBloc,
              child:  ListView(
                children: [
                  const SizedBox(height: 30,),
                  Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      child: Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 10, right: 10,top: 10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _name,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _dependent,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Dependent',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your dependent';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _phoneNumber,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Phone Number',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _emailAddress,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Email Address',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _location,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Location',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter location';
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
                                    labelText: 'Enter Check In Date',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter check in date';
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
                                    labelText: 'Enter Check In Time',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter check in time';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _vaccStatus,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Vaccination Status',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter vaccination status';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _riskStatus,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter Risk Status',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter risk status';
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
                                    MaterialStateProperty.all(Colors.lightGreen)),
                                    onPressed: () async {
                                      if (_formKey.currentState!
                                          .validate()) {
                                        //add to model
                                        UserMovementModel userMovementModel = UserMovementModel(
                                            name: _name.text,
                                            dependent: _dependent.text,
                                            phoneNumber: _phoneNumber.text,
                                            emailAddress: _emailAddress.text,
                                            location: _location.text,
                                            date: _date.text,
                                            time: _time.text,
                                            vaccStatus: _vaccStatus.text,
                                            riskStatus: _riskStatus.text);

                                        //add to bloc
                                        userMovementBloc
                                            .add(InsertUserData(userMovementModel));

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Check In Successfully'),
                                            backgroundColor: Colors.blueAccent
                                          ),
                                        );
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => const CheckInReport()),
                                      );
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ],
              ),),
        ),
      ),
    );
  }
}
