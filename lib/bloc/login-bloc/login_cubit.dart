import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc_session/bloc/login-bloc/login_state.dart';
import 'package:learning_bloc_session/models/userModel.dart';

class LoginCubit extends Cubit<LogState> {
  LoginCubit() : super(InitialLogState());

  void loginUser() {
    emit(LoggingInState());
    UserModel user = UserModel(username: "arshman", password: "arshman");
    Future.delayed(Duration(seconds: 6))
        .then((value) => emit(LoggedInState(currentUser: user)));
  }
}
