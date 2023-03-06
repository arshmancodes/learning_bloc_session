import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc_session/bloc/login-bloc/login_cubit.dart';
import 'package:learning_bloc_session/bloc/login-bloc/login_state.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LogState>(
        builder: (context, state) {
          if (state is LoggedInState) {
            return Scaffold(
              appBar: AppBar(),
              body: SafeArea(
                child: Center(
                    child: Column(
                  children: [Text("Hello ${state.currentUser!.username}")],
                )),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: CircularProgressIndicator(),
            );
          }
        },
        listener: (context, state) {});
  }
}
