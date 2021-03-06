import 'package:diary_web_app/screens/main_page.dart';
import 'package:diary_web_app/services/service.dart';
import 'package:diary_web_app/widgets/input_decorator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    Key? key,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
    GlobalKey<FormState>? formKey,
  })  : _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _globalKey = formKey,
        super(key: key);

  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final GlobalKey<FormState>? _globalKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _globalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                'Please enter a valid email and password that is at least 15 characters.'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  return value!.isEmpty ? 'Please enter an email' : null;
                },
                controller: _emailTextController,
                decoration: buildInputDecoration('email', 'john@me.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  return value!.isEmpty ? 'Please enter an password' : null;
                },
                obscureText: true,
                controller: _passwordTextController,
                decoration: buildInputDecoration('password', 'password'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                if (_globalKey!.currentState!.validate()) {
                  String email = _emailTextController.text;
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: _passwordTextController.text)
                      .then((value) {
                    if (value.user != null) {
                      DiaryService()
                          .createUser(email.split('@')[0], context,
                              value.user!.uid, 'Musician')
                          .then((value) {
                        DiaryService()
                            .loginUser(email, _passwordTextController.text);
                      }).then((value) {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const MainPage();
                          }),
                        );
                      });
                    }
                  });
                }
              },
              child: const Text('Create Account'),
            )
          ],
        ));
  }
}
