import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizz_app/feutures/login/widgets/login_button.dart';
import 'package:quizz_app/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LoginButton(
          color: Colors.orange,
          text: 'Logout',
          icon: FontAwesomeIcons.arrowLeft,
          onPressed: () {
            Navigator.of(context).pushNamed('/login');
            Auth().signOut(context: context);
          },
        ),
      ),
    );
  }
}
