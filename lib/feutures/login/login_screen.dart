import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizz_app/feutures/login/widgets/login_button.dart';
import 'package:quizz_app/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? usernameEC;
    TextEditingController? passwordEC;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Login screen',
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginTextInput(
                  textEditingController: usernameEC,
                  lableText: 'Username',
                ),
                LoginTextInput(
                  textEditingController: passwordEC,
                  lableText: 'Password',
                ),
                Spacer(
                  flex: 2,
                ),
                LoginButton(
                  color: Colors.orangeAccent,
                  icon: FontAwesomeIcons.arrowRight,
                  onPressed: () {
                    Auth().signInAnonymously(context: context);
                  },
                  text: 'Login Anonana',
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginTextInput extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String lableText;

  LoginTextInput({Key? key, required this.textEditingController, required this.lableText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorWidth: 3,
          cursorColor: Colors.white,
          controller: textEditingController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            labelText: lableText,
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
