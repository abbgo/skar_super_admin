import 'package:flutter/material.dart';
import 'package:skar_super_admin/pages/dashboard/dashboard.dart';

goToPage(
  BuildContext context,
  Widget page,
  bool forReplace,
) {
  return context.mounted
      ? forReplace
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
      : null;
}

goToDashboard(BuildContext context) {
  return context.mounted
      ? Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
          (Route<dynamic> route) => false,
        )
      : null;
}
