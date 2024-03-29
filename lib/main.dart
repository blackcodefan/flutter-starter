import 'l10n/l10n.dart';
import 'routes.gr.dart';
import 'auth_app/guard.dart';
import 'global_bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(App(prefs: prefs));
}


class App extends StatelessWidget {

  final SharedPreferences prefs;
  App({Key? key, required this.prefs}) : super(key: key);

  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>(
              lazy: false,
              create: (_) => SettingsBloc(prefs)
          ),
          BlocProvider<AuthBloc>(create: (_) => AuthBloc(_, router: _appRouter)),
        ],
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
        ));
  }
}