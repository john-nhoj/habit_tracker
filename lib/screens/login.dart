import 'package:flutter/material.dart';
import 'package:habit_tracker/controllers/TextFormFields.dart';
import 'package:habit_tracker/controllers/fetch.dart';
import 'package:habit_tracker/models/routes.dart';
import 'package:habit_tracker/models/user.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login')), body: Center(child: LoginForm()));
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final fetch = Fetch();
  final emailTextField = EmailTextFormField();
  final passwordTextField = PasswordTextFormField();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
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
                  Wrap(
                      runSpacing: 20,
                      children: <Widget>[emailTextField, passwordTextField]),
                  RaisedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        fetch.post({
                          "email": emailTextField.getValue(),
                          "password": passwordTextField.getValue()
                        }, '/auth').then((response) {
                          userProfile.updateUserProfile(response.getData());
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes().getRoute(RouteNames.HOME),
                              (route) => false);
                        }, onError: (error) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Email or password incorrect.')));
                        });
                      }
                    },
                    child: Text('Login'),
                  )
                ])));
  }
}
