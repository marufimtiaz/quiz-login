import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/components/my_button.dart';
import 'package:quiz/components/textfield.dart';
import '../helper/helper_functions.dart';
import '../components/selectors.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _updateStudentLabel(String label) async {
    setState(() {
      studentLabel = label;
    });
    await saveStudentLabel(label);
  }

  void login() async {
    //Firebase
    //Show loading
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );

    if (studentLabel == null) {
      //Pop loading circle
      Navigator.pop(context);
      //Show error
      DisplayMessageToUser("Select your Occupation!", context);
    } else {
      try {
        //login
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        //Loading
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //loading circle
        Navigator.pop(context);
        //show error
        DisplayMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetching screen height and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChoiceCard(
                        icon: Icons.school,
                        text: 'Student',
                        color: Colors.green,
                        borderColor: (studentLabel == "student")
                            ? Colors.green
                            : Colors.grey.shade300,
                        onTap: () {
                          _updateStudentLabel("student");
                        },
                      ),
                      ChoiceCard(
                        icon: Icons.person,
                        text: 'Teacher',
                        color: Colors.teal,
                        borderColor: (studentLabel == "teacher")
                            ? Colors.teal
                            : Colors.grey.shade300,
                        onTap: () {
                          _updateStudentLabel("teacher");
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  CustomTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email here',
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter password',
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password tap event here
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomButton(
                    label: 'Sign In',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: login,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont have an account? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Column(
                    children: [
                      CustomButton(
                        label: 'Sign in with Google',
                        icon: Icons.g_mobiledata,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.grey,
                        onPressed: () {
                          // Handle Google sign in button press
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomButton(
                        label: 'Sign in with Apple',
                        icon: Icons.apple,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.grey,
                        onPressed: () {
                          // Handle Apple sign in button press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
