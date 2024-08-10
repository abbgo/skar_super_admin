import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/avatar.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/log_out_button.dart';

AppBar myAppBar(String page) => AppBar(
      centerTitle: false,
      title: Text('Gozleg'),
      actions: const [
        AvatarPart(),
        LogOutButton(),
      ],
    );
