import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/routes.gr.dart';
import 'package:flutter_starter/global_bloc/index.dart';

void main () => runApp(const App());


class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _appRouter = AppRouter();

    return BlocProvider<SettingsBloc>(
        lazy: false,
        create: (context) => SettingsBloc(),
        child: BlocBuilder<SettingsBloc, SettingsBlocState>(
          builder: (context, SettingsBlocState state) {
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