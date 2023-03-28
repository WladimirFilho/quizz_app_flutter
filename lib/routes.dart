import 'package:quizz_app/feutures/about/about_screen.dart';
import 'package:quizz_app/feutures/home/home_screen.dart';
import 'package:quizz_app/feutures/login/login_screen.dart';
import 'package:quizz_app/feutures/profile/profile_screen.dart';
import 'package:quizz_app/feutures/topics/topics_screen.dart';

var appRoutes = {
  '/home': (context) => HomeScreen(),
  '/': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
};
