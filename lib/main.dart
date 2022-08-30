import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/routes.gr.dart';
import 'package:flutter_starter/global_bloc/index.dart';

void main () => runApp(App());


class App extends StatelessWidget {

  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return BlocProvider<SettingsBloc>(
        lazy: false,
        create: (context) => SettingsBloc(),
        child: BlocBuilder<SettingsBloc, SettingsBlocState>(
          builder: (context, SettingsBlocState state) {
            print(state.theme);
            print('=============');
            return MaterialApp.router(
                debugShowCheckedModeBanner: true,
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                title: 'Flutter Starter Application',
                theme: state.theme);
          },
        ),
        );
  }
}