import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saloon/bloc/cubits/user_cubit.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    bool isPremium = UserCubit.get(context).loggedUser!.isPremium;

    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text("Settings"),
        ),
        SettingsList(sections: [
          SettingsSection(
            title: Text("Account"),
            tiles: [
              SettingsTile.navigation(
                  leading: SvgPicture.asset(
                    'assets/icons/crown.svg',
                    width: 20,
                    height: 20,
                  ),
                  title: Text(""))
            ],
          )
        ])
      ],
    );
  }
}
