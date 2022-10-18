import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _userId;
  String _password;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Form is valid UserId: $_userId, password: $_password');
    } else {
      print('Form is invalid UserId: $_userId, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('login demo'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: '아이디'),
                validator: (value) =>
                value!.isEmpty ? '아이디를 입력해주세요.' : null,
                onSaved: (value) => _userId = value!,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: '비밀번호'),
                validator: (value) =>
                value!.isEmpty ? '비밀번호를 입력해주세요.' : null,
                onSaved: (value) => _password = value!,
              ),
            ],
          )
        )
      )
    );
  }
}
