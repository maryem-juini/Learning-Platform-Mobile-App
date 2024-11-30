import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningplatform/blocs/basic_auth/basic_auth_bloc.dart';
import 'package:learningplatform/const/assets.dart';
import 'package:learningplatform/repos/auth_repo.dart';
import 'package:learningplatform/ui/widgets/Button.dart';
import 'package:learningplatform/ui/widgets/InputField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => BasicAuthBloc(AuthRepo()),
      child: Scaffold(
        body: BlocConsumer<BasicAuthBloc, BasicAuthState>(
          listener: (context, state) {
            print('Form Status: ${state.formStatus}');
            if (state.formStatus == FormStatus.success) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else if (state.formStatus == FormStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'Sign in failed')),
              );
            }
          },
          builder: (context,state){
            return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.logo,
                  width: size.width * .4,
                  height: size.height * .4,
                ),
                SizedBox(height: size.height * 0.1),
                InputFieldWidget(
                  obscureText: false,
                  labelText: 'Email Address',
                  onChangedFunction: (value) {
                    print('Email input changed: $value'); 
                    context.read<BasicAuthBloc>().add(EmailChanged(value));
                  },
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
                  onChangedFunction: (value) =>
                      context.read<BasicAuthBloc>().add(PasswordChanged(value)),
                ),
                SizedBox(height: size.height * 0.02),
                ButtonWidget(
                  labelText: 'Sign In',
                  onPressedFunction: () {
                    context.read<BasicAuthBloc>().add(SignInSubmitted());
                  },
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 146, 149, 154),
                        fontSize: size.width * 0.03,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sign_up');
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 255),
                          fontSize: size.width * 0.03,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
          }
        ),
      ),
    );
  }
}
