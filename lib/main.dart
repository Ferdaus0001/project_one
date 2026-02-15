import 'package:adsf/profile_screen.dart';
import 'package:adsf/prograsss.dart';
import 'package:adsf/sing_in_scren.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'flip_card_screen.dart';
import 'nid_card_screen.dart';
import 'otp_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontNIDScreen(),
    );
  }
}
