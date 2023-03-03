import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:flutter_starter/routes.gr.dart';
import 'package:flutter_starter/global_bloc/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main () async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(App(prefs: prefs));
}


class App extends StatelessWidget {

  final SharedPreferences prefs;
  App({Key? key, required this.prefs}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return BlocProvider<SettingsBloc>(
        lazy: false,
        create: (context) => SettingsBloc(prefs),
        child: BlocBuilder<SettingsBloc, SettingsBlocState>(
          builder: (context, SettingsBlocState state) {
            return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                title: 'Flutter Starter Application',
                locale: state.locale,
                supportedLocales: L10n.all,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate
                ],
                theme: state.theme);
          },
        ),
        );
  }
}