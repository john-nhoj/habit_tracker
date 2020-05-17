import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_tracker/models/user.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sign Up Page')),
        body: Center(child: SignUpForm()));
  }
}

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<UserModel>(context);
    return Form(
        key: _formKey,
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Wrap(runSpacing: 20, children: <Widget>[
                    TextFormField(
                      controller: usernameController,
                      decoration:
                          InputDecoration(labelText: 'Enter your username'),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration:
                          InputDecoration(labelText: 'Enter your email'),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration:
                          InputDecoration(labelText: 'Enter your password'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ]),
                  RaisedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        var response = await post(
                            'https://habit-tracker-backend.herokuapp.com/api/auth/register',
                            body: {
                              "username": usernameController.text.trim(),
                              "email": emailController.text.trim(),
                              "password": passwordController.text.trim()
                            });

                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Thank you for registering!')));

                        if (response.statusCode == 200) {
                          Map userMap = jsonDecode(response.body);
                          userProfile.updateUserProfile(userMap);
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: Text('Submit'),
                  )
                ])));
  }
}
