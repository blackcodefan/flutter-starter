import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/auth/index.dart';
import 'package:flutter_starter/routes.gr.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState>{

  final BuildContext context;
  final AppRouter router;

  AuthBloc(this.context, { required this.router }) : super(AuthState()){
    router.authGuard.authBloc = this;

    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        add(UnAuthenticated());
      } else {
        add(Authenticated(true, UserModel.fromFirebaseUser(user)));
      }
    });

    on<Authenticated>((event, emit) {
      if (state.authenticated != true) {
        router.replaceNamed('/home');
      }
      emit(AuthBlocState.clone(state, authenticated: event.authenticated, user: event.user));
    });

    on<UnAuthenticated>((event, emit) {
      emit(AuthBlocState.clone(state, authenticated: false, user: null));
      router.popUntilRoot();
      router.replaceNamed('/login');
    });

    on<UpDateAuthUser>((event, emit) => emit(AuthBlocState.clone(state, user: event.user)));

    on<ReloadUser>((event, emit) async{
      await FirebaseAuth.instance.currentUser?.reload();
    });

    on<Logout>((event, emit) async {
      await FirebaseAuth.instance.signOut();
    });
  }

}