import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/auth_app/index.dart';
import 'package:flutter_starter/global_bloc/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/theme/index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}): super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<AuthBloc>().state.user!;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                AppLocalizations.of(context)!.account,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize
                ),
              ),
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(user.account),
              subtitle: Text(user.id),
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize
                ),
              ),
            ),
            const Divider(),
            ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('English'),
                trailing: context.read<SettingsBloc>().state.localeIs('en')
                    ? const Icon(Icons.check) : null,
                selected: context.read<SettingsBloc>().state.localeIs('en'),
                onTap: () => context.read<SettingsBloc>().add(ChangeLocale(const Locale('en')))
            ),
            ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('German'),
                trailing: context.read<SettingsBloc>().state.localeIs('de')
                    ? const Icon(Icons.check) : null,
                selected: context.read<SettingsBloc>().state.localeIs('de'),
                onTap: () => context.read<SettingsBloc>().add(ChangeLocale(const Locale('de')))
            ),
            ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(AppLocalizations.of(context)!.system),
                trailing: context.read<SettingsBloc>().state.localeIs('system')
                    ? const Icon(Icons.check) : null,
                selected: context.read<SettingsBloc>().state.localeIs('system'),
                onTap: () => context.read<SettingsBloc>().add(ClearLocale())
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                AppLocalizations.of(context)!.theme,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize
                ),
              ),
            ),
            const Divider(),
            ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(AppLocalizations.of(context)!.light),
                trailing: context.read<SettingsBloc>().state.themeIs(ThemeName.light)
                    ? const Icon(Icons.check) : null,
                selected: context.read<SettingsBloc>().state.themeIs(ThemeName.light),
                onTap: () => context.read<SettingsBloc>().add(ChangeTheme(ThemeName.light))
            ),
            ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(AppLocalizations.of(context)!.dark),
                trailing: context.read<SettingsBloc>().state.themeIs(ThemeName.dark)
                    ? const Icon(Icons.check) : null,
                selected: context.read<SettingsBloc>().state.themeIs(ThemeName.dark),
                onTap: () => context.read<SettingsBloc>().add(ChangeTheme(ThemeName.dark))
            ),
            ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(AppLocalizations.of(context)!.system),
                trailing: context.read<SettingsBloc>().state.themeIs(ThemeName.system)
                    ? const Icon(Icons.check) : null,
                selected: context.read<SettingsBloc>().state.themeIs(ThemeName.system),
                onTap: () => context.read<SettingsBloc>().add(ClearTheme())
            ),
          ],
        ),
      ),
    );
  }
}