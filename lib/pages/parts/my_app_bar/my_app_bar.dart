import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/parts/my_app_bar/parts/avatar.dart';

AppBar myAppBar() => AppBar(
      actions: const [
        AvatarPart(),
      ],
    );
