import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/conversation_details.dart';
import 'package:whatsapp_clone/src/home_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/conversation-details": (context) => const ConversationDetails()
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
