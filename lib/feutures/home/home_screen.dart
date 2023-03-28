import 'package:flutter/material.dart';
import 'package:quizz_app/feutures/topics/topics_screen.dart';

import '../../services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: Auth().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Waiting');
        } else if (snapshot.hasError) {
          return Text('Error');
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        }
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/about');
              },
              child: Text(
                'about',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}
