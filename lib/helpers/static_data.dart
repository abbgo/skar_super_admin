import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skar_super_admin/styles/colors.dart';

String apiUrl = dotenv.env['API_URL']!;
String pathUrl = dotenv.env['PATH_URL']!;

Map<String, String>? tokenHeader(String accessToken) {
  return {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json'
  };
}

const pageSize = 10;

class CreatedStatuses {
  CreatedStatuses._();

  static const int wait = 0;
  static const int rejected = 1;
  static const int success = 2;
}

class Genders {
  Genders._();

  static const int male = 0;
  static const int female = 1;
  static const int child = 2;
}

Center errorMethod(Object error) {
  return Center(
    child: Text(error.toString(), textAlign: TextAlign.center),
  );
}

Image errImage = Image.asset("assets/images/back_logo.jpg", fit: BoxFit.cover);

Widget loadWidget =
    Center(child: CircularProgressIndicator(color: elevatedButtonColor));

Widget loadProcess = Container(
  height: double.infinity,
  width: double.infinity,
  color: Colors.white.withOpacity(.5),
  child: Center(child: CircularProgressIndicator(color: elevatedButtonColor)),
);
