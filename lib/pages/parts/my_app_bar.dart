import 'package:flutter/material.dart';

AppBar myAppBar() => AppBar(
      actions: [
        CircleAvatar(
          child: Image.asset("assets/images/logo.jpg"),
        ),
      ],
    );
