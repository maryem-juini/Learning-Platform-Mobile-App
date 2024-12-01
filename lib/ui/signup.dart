import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learningplatform/blocs/basic_auth/basic_auth_bloc.dart';
import 'package:learningplatform/const/assets.dart';
import 'package:learningplatform/repos/auth_repo.dart';
import 'package:learningplatform/ui/widgets/Button.dart';
import 'package:learningplatform/ui/widgets/InputField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordObscured = true;
  String _email = '';
  String _password = '';
  String _name = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signUp() async {
    try {
      // Authenticate user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Store user information in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': _name,
        'email': _email,
      });

      // Navigate to another page or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-up successful!')),
      );
      Navigator.pushNamed(context, '/home'); // Replace with your home route
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => BasicAuthBloc(AuthRepo()),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.logo,
                width: size.width * .4,
                height: size.height * .4,
              ),
              SizedBox(height: size.height * 0.05),
              InputFieldWidget(
                obscureText: false,
                labelText: 'Name',
                onChangedFunction: (value) => setState(() {
                  _name = value;
                }),
              ),
              SizedBox(height: size.height * 0.02),
              InputFieldWidget(
                obscureText: false,
                labelText: 'Email Address',
                onChangedFunction: (value) => setState(() {
                  _email = value;
                }),
              ),
              SizedBox(height: size.height * 0.02),
              InputFieldWidget(
                obscureText: _isPasswordObscured,
                labelText: 'Password',
                iconButton: IconButton(
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
                ),
                onChangedFunction: (value) => setState(() {
                  _password = value;
                }),
              ),
              SizedBox(height: size.height * 0.02),
              ButtonWidget(
                labelText: 'Sign Up',
                onPressedFunction: _signUp,
              ),
              SizedBox(height: size.height * 0.02),
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
                      Navigator.pushNamed(context, '/sign_in');
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
      ),
    );
  }
}
