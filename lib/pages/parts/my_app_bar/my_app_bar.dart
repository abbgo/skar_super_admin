import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/avatar.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/log_out_button.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/pages_app_bar.dart';

AppBar myAppBar(String page) {
  Widget titlePage = const SizedBox();

  switch (page) {
    case 'waiting_shops':
      titlePage = const PagesAppBar();
      break;
    case 'active_shops':
      titlePage = const PagesAppBar();
      break;
    case 'waiting_products':
      titlePage = const PagesAppBar();
      break;
    case 'active_products':
      titlePage = const PagesAppBar();
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
