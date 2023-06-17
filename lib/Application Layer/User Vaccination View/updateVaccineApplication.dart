import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Services Layer/User Vaccination Controller/userVaccStatus_bloc.dart';
import '../../Data Layer/Model/UserVaccinationModel.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({Key? key}) : super(key: key);

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _phonenum = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _dependentID = TextEditingController();
  final UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Update User Vaccine Application'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                userBloc.add(GetUserData(id));
                return userBloc;
              },
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateUserLoad) {
                    _name.text = state.userModel.name;
                    _phonenum.text = state.userModel.phonenum;
                    _address.text = state.userModel.address;
                    _dependentID.text = state.userModel.dependentID;

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
                                          return 'Please enter your name!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _phonenum,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter your phone number',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your phone number!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _address,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter your address',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your address!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _dependentID,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter your dependent ID',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your dependent ID!';
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
                                            UserModel userModel = UserModel(
                                                id: id,
                                                name: _name.text,
                                                phonenum: _phonenum.text,
                                                address: _address.text,
                                                dependentID: _dependentID.text);

                                            //update to bloc
                                            userBloc
                                                .add(UpdateUserData(userModel));

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
