import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/404.dart';
import 'package:whatsapp_clone/src/sliver_app_bar.dart';

import 'src/conversation_details.dart';
import 'src/home_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  _buildRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: "/home",
      home: SliverAppBarPage(),
      routes: {
        "/home": (context) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        if (settings.name == "/home") {
          return _buildRoute(const HomePage());
        }
        if (settings.name == "/conversation-details") {
          var params = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
              builder: (context) =>
                  ConversationDetails(sender: params['sender']));
        }

        return _buildRoute(const Page404());
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
