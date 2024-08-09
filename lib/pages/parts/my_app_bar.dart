import 'package:flutter/material.dart';
import 'package:skar_super_admin/styles/colors.dart';

AppBar myAppBar() => AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundColor: logoColor,
            child: const Text(
              'AB',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
