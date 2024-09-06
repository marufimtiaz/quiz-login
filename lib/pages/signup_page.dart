import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/components/my_button.dart';
import 'package:quiz/components/textfield.dart';
import '../helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  void register() async {
    //Firebase
    //Loading Circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
    //Match Passwords
    if (passwordController.text != passwordConfirmController.text) {
      //Pop loading circle
      Navigator.pop(context);
      //Show error
      DisplayMessageToUser("Passwords don't match!", context);
    }
    //Try creating
    else {
      try {
        //Create user
        // UserCredential? userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  CustomTextField(
                    controller: usernameController,
                    labelText: 'Username',
                    hintText: 'Enter your username here',
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email here',
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter new password',
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    controller: passwordConfirmController,
                    labelText: 'Confirm Password',
                    hintText: 'Enter password again',
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomButton(
                    label: 'Sign Up',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: register,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Sign In",
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
