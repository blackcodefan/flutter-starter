import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/global_bloc/auth/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthBlocState>(
            listenWhen: (AuthBlocState before, AuthBlocState after){
              return before.authenticated != after.authenticated;
            },
            listener: (ctx, AuthBlocState state) async{
              if(state.authenticated == true) {
                AutoRouter.of(context).popUntilRoot();
                AutoRouter.of(context).pushNamed('/home');
              } else if (state.authenticated == false){
                AutoRouter.of(context).popUntilRoot();
                await AutoRouter.of(context).pushNamed('/login');
              }
            },
            builder: (context, state){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/auth/logo.png',
                        width: 100,
                        height: 100
                    ),
                    const Divider(color: Colors.transparent),
                    const Text(
                        'Flutter Starter App',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        )
                    )
                  ],
                )
            );
            }
        )
    );
  }
}