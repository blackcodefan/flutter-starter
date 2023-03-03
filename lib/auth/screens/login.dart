import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/global_bloc/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_validator/form_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message!);
    } catch (e) {
      print(e);
    }
  }

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
              ListTile(
                title: TextFormField(
                  validator: ValidationBuilder(localeName: context.read<SettingsBloc>().state.localName).required().email().build(),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.email,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
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
                  onSaved: (String? value){
                    email = value!;
                  },
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: ValidationBuilder(localeName: context.read<SettingsBloc>().state.localName).required().minLength(6).build(),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
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
                  onSaved: (String? value) {
                    password = value!;
                  },
                ),
              ),
              ListTile(
                title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 40)
                    ),
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        signIn();
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.login)
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}