import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  final String _text = 'Enter your email';
  final Function _validateEmail =
      (String value) => value.isEmpty ? 'Enter a valid email.' : null;
  final TextEditingController _controller = TextEditingController();

  String getValue() => _controller.text;
  void dispose() => _controller.dispose();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _controller,
        decoration: InputDecoration(labelText: _text),
        validator: _validateEmail);
  }
}

class UsernameTextFormField extends StatelessWidget {
  final String _text = 'Enter your username';
  final Function _validateUsername = (String value) => value.isEmpty
      ? 'Enter a valid username.'
      : (value.trim().length < 4
          ? 'Username too short (min 4 characters)'
          : null);
  final TextEditingController _controller = TextEditingController();

  String getValue() => _controller.text;
  void dispose() => _controller.dispose();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _controller,
        decoration: InputDecoration(labelText: _text),
        validator: _validateUsername);
  }
}

class PasswordTextFormField extends StatelessWidget {
  final String _text = 'Enter your password';
  final Function _validatePassword =
      (String value) => value.isEmpty ? 'Enter a valid password.' : null;
  final TextEditingController _controller = TextEditingController();

  String getValue() => _controller.text;
  void dispose() => _controller.dispose();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: true,
        controller: _controller,
        decoration: InputDecoration(labelText: _text),
        validator: _validatePassword);
  }
}
