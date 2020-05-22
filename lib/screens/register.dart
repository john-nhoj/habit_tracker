import 'package:flutter/material.dart';
import 'package:habit_tracker/controllers/TextFormFields.dart';
import 'package:habit_tracker/controllers/fetch.dart';
import 'package:habit_tracker/models/user.dart';
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
  final usernameTextField = UsernameTextFormField();
  final emailTextField = EmailTextFormField();
  final passwordTextField = PasswordTextFormField();
  final fetch = Fetch();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameTextField.dispose();
    emailTextField.dispose();
    passwordTextField.dispose();
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
                    usernameTextField,
                    emailTextField,
                    passwordTextField
                  ]),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        fetch.post({
                          "username": usernameTextField.getValue(),
                          "email": emailTextField.getValue(),
                          "password": passwordTextField.getValue()
                        }, '/register').then((response) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Thank you for registering!')));
                          userProfile.updateUserProfile(response.getData());
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Text('Submit'),
                  )
                ])));
  }
}
