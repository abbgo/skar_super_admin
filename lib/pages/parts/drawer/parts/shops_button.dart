import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/navigators.dart';
import 'package:skar_super_admin/styles/colors.dart';

class ShopsButton extends StatelessWidget {
  const ShopsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.storefront, color: logoColor),
      title: Text(
        'Dukanlar',
        style: TextStyle(
          color: elevatedButtonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => goToDashboard(context),
    );
  }
}
