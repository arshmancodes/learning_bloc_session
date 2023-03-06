import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc_session/bloc/login-bloc/login_cubit.dart';
import 'package:learning_bloc_session/bloc/login-bloc/login_state.dart';
import 'package:learning_bloc_session/views/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LogState>(builder: (context, state) {
      if (state is LoggingInState) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Text("This is the login screen"),
                  ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().loginUser();
                      },
                      child: Text("Login Me"))
                ]),
              ),
            ),
          ),
        );
      }
    }, listener: (context, state) {
      if (state is LoggedInState) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Dashboard()));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Logged in Successfully!")));
      }
      if (state is LogInErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("User Credentials do not match!")));
      }
      if (state is LoggingInState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Logging in....")));
      }
    });
  }
}
