import 'package:c_h_c/Application%20Layer/Homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Application Layer/profileInfo/userProfileView.dart';
import '../../Application Layer/profileInfo/registration.dart';
import '../../Services Layer/profileInfoController/profileInfoBloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    final ProfileInfoBloc profileInfoBloc = ProfileInfoBloc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Text('Login'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
            create: (_) => profileInfoBloc,
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
                                controller: _username,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter Username',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Username';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _password,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
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
                                      //add to bloc
                                      profileInfoBloc.add(LoginProfileInfo(
                                          _username.text, _password.text));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Login Successfully'),
                                          backgroundColor: Colors.blueAccent,
                                        ),
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()),
                                      );
                                    }
                                  },
                                  child: const Text('Login') ,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text('Does not have account?'),
                                  TextButton(
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegistrationPage()),
                                      );
                                      //signup screen
                                    },
                                  )
                                ],
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
