import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/global_bloc/index.dart';
import 'package:flutter_starter/theme/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Please enter the email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(8)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Please enter the email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              TextButton(onPressed: (){
                context.read<SettingsBloc>().add(ChangeTheme(ThemeName.light));
              }, child: Text('Light')),
              TextButton(onPressed: (){
                context.read<SettingsBloc>().add(ChangeTheme(ThemeName.dark));
              }, child: Text('Dark')),
            ],
          )
        ),
      )
    );
  }
}