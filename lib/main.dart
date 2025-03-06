import 'package:RachnaAI/%20controllers/chat_controller.dart';
import 'package:RachnaAI/ui/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ChatController>(ChatController()); // Initialize ChatController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat with Rachna',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
