import 'package:learning_bloc_session/models/userModel.dart';

class LogState {}

class InitialLogState extends LogState {}

class LoggingInState extends LogState {}

class LogInErrorState extends LogState {}

class LoggedInState extends LogState {
  UserModel? currentUser;
  LoggedInState({this.currentUser});
}
