import 'package:flutter/material.dart';
import 'package:learningplatform/ui/widgets/Button.dart';
import 'package:learningplatform/ui/widgets/InputField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordObscured = false;
  bool _isConfirmPasswordObscured = false;
  TextEditingController fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo-dark.png',
              width: size.width * .4,
              height: size.height * .4,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            InputFieldWidget(obscureText: false, labelText: 'Full Name', controller: fullNameController),
            SizedBox(
              height: size.height * 0.02,
            ),
            InputFieldWidget(obscureText: false, labelText: 'Email Address', controller: fullNameController),
            SizedBox(
              height: size.height * 0.02,
            ),
            InputFieldWidget(obscureText: false, labelText: 'Password', controller: fullNameController, iconButton: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),),
            SizedBox(
              height: size.height * 0.02,
            ),
            InputFieldWidget(obscureText: false, labelText: 'Confirm Password', controller: fullNameController, iconButton: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),),
                        SizedBox(
              height: size.height * 0.02,
            ),
            ButtonWidget(routeName: '/home', labelText: 'Sign Up'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You have an account?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 146, 149, 154),
                    fontSize: size.width * 0.03,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add navigation to Login Page here
                  },
                  child: Text(
                    " Sign In",
                    style: TextStyle(
                      color: Color(0xFFFBAA1B),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
