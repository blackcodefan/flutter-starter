part of 'package:flutter_starter/global_bloc/auth/auth_bloc.dart';

abstract class AuthBlocStateInterface extends Equatable {
  final bool? authenticated;

  final UserModel? user;

  const AuthBlocStateInterface({this.authenticated, this.user});
}

class AuthBlocState implements AuthBlocStateInterface {

  AuthBlocState({this.authenticated = false, this.user});

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

  @override
  final bool? authenticated;

  @override
  final UserModel? user;

  factory AuthBlocState.clone(AuthBlocState model, {bool? authenticated, UserModel? user}){
    if(model is AuthState){
      return AuthStateAlt(authenticated: authenticated ?? model.authenticated, user: user ?? model.user);
    } else {
      return AuthState(authenticated: authenticated ?? model.authenticated, user: user ?? model.user);
    }
  }

}

class AuthState extends AuthBlocState{

  AuthState({authenticated, user}) : super(authenticated: authenticated, user: user);
}

class AuthStateAlt extends AuthBlocState{

  AuthStateAlt({authenticated, user}): super(authenticated: authenticated, user: user);
}