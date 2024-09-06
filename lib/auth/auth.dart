import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/auth/login_or_register.dart';
import 'package:quiz/components/selectors.dart';
import 'package:quiz/pages/add_quiz.dart';
import 'package:quiz/helper/helper_functions.dart';

import '../pages/subject_list.dart'; // Import your helper function

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    _loadStudentLabel();
  }

  void _loadStudentLabel() async {
    studentLabel = await getStudentLabel();
    setState(() {}); // Trigger rebuild to reflect the loaded value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //logged in
            if (snapshot.hasData && studentLabel == "student") {
              return const ClassesList();
            } else if (snapshot.hasData && studentLabel == "teacher") {
              return const QuizCreator();
            } else {
              return const LoginOrRegister();
            }
            //not logged in
          }),
    );
  }
}
