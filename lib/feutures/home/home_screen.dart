import 'package:flutter/material.dart';
import 'package:quizz_app/feutures/topics/topics_screen.dart';

import '../../services/auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream userStream = Auth().userStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Waiting');
        } else if (snapshot.hasError) {
          return const Text('Error');
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
