import 'package:flutter/material.dart';
import 'package:untitled/service/shared_prefrence_helper.dart';
import 'package:untitled/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init();
  runApp(AppRoot());
}

