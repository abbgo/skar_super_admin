import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_super_admin/models/admin.dart';
import 'package:skar_super_admin/providers/local_storadge.dart';
import 'package:skar_super_admin/styles/colors.dart';

class AvatarPart extends ConsumerWidget {
  const AvatarPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String adminData = ref.watch(adminDataProvider);
    Map<String, dynamic> jsonMap = jsonDecode(adminData);
    Admin admin = Admin.fromJson(jsonMap);
    List<String> names = admin.fullName.split(' ');
    String f = names[0][0];
    String l = names[1][0];
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: logoColor,
            child: Text(
              '$f$l',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                admin.fullName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(admin.isSuperAdmin ? 'Super Admin' : 'Admin'),
            ],
          ),
        ],
      ),
    );
  }
}
