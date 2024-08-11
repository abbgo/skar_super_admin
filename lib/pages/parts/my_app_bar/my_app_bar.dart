import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/avatar.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/log_out_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/next_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/previous_button.dart';
import 'package:skar_super_admin/pages/waiting_shops/parts/search_wainting_shops.dart';

AppBar myAppBar(String page) {
  Widget titlePage = const SizedBox();

  switch (page) {
    case 'waiting_shops':
      titlePage = const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchWaintingShops(),
          SizedBox(width: 10),
          PreviousButton(),
          SizedBox(width: 5),
          NextButton(),
        ],
      );
      break;
    default:
  }

  return AppBar(
    centerTitle: false,
    title: titlePage,
    actions: const [
      AvatarPart(),
      LogOutButton(),
    ],
  );
}
