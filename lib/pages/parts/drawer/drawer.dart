import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/styles/colors.dart';

class DrawerPart extends StatelessWidget {
  const DrawerPart({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.jpg"),
          ),
          ListTile(
            leading: Icon(Icons.home, color: logoColor),
            title: Text(
              lang.homepage,
              style: TextStyle(color: elevatedButtonColor),
            ),
            onTap: () => goToDashboard(context),
          ),
        ],
      ),
    );
  }
}
