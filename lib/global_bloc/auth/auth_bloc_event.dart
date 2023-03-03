part of 'package:flutter_starter/global_bloc/auth/auth_bloc.dart';

abstract class AuthBlocEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthBlocEvent{
  final bool authenticated;
  final UserModel user;

  Authenticated(this.authenticated, this.user);
}

class UnAuthenticated extends AuthBlocEvent{}

class Logout extends AuthBlocEvent{}

class UpDateAuthUser extends AuthBlocEvent{
  final UserModel user;
  UpDateAuthUser(this.user);
}

class ReloadUser extends AuthBlocEvent{}